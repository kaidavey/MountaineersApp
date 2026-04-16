"""
scraper.py — Mountaineers activity scraper
Scrapes upcoming activities from mountaineers.org and uploads them to Firebase Firestore.

SETUP:
  pip install requests beautifulsoup4 firebase-admin

  Place your Firebase service account key JSON at scraper/serviceAccountKey.json
  (download from Firebase Console > Project Settings > Service Accounts > Generate new private key)

USAGE:
  python scraper.py                        # scrape all categories
  python scraper.py --category "Hiking & Backpacking"   # one category only
  python scraper.py --dry-run              # print results, don't upload
"""

import argparse
import json
import re
import sys
from datetime import datetime, timezone
from pathlib import Path

import requests
from bs4 import BeautifulSoup

# ---------------------------------------------------------------------------
# Category → SF Symbol icon mapping (matches ActivityTileDataService in app)
# ---------------------------------------------------------------------------
CATEGORY_ICONS: dict[str, str] = {
    "Backcountry Skiing": "skis.fill",
    "Bikepacking": "bicycle",
    "Canyoning": "water.waves",
    "Climbing": "figure.climbing",
    "Cross-country Skiing": "figure.skiing.crosscountry",
    "Global Adventures": "globe.americas.fill",
    "Hiking & Backpacking": "figure.hiking",
    "Naturalist": "leaf.fill",
    "Night Sky": "moon.stars.fill",
    "Packrafting": "ferry.fill",
    "Photography": "camera.fill",
    "Sailing": "sailboat.fill",
    "Scrambling": "mountain.2.fill",
    "Sea Kayaking": "kayak",  # fallback below if unavailable
    "Snowshoeing": "snowflake",
    "Stewardship": "hand.raised.fill",
    "Trail Running": "figure.run",
    "Urban Walks & Adventures": "figure.walk.circle.fill",
    "Youth & Family": "figure.2.and.child.holdinghands",
}

BASE_URL = "https://www.mountaineers.org"

# ---------------------------------------------------------------------------
# Scraping helpers
# ---------------------------------------------------------------------------

def build_search_url(category: str, page: int = 1) -> str:
    """Build the mountaineers.org search URL for a given activity category."""
    slug = category.lower().replace(" & ", "-").replace(" ", "-")
    return f"{BASE_URL}/activities/find-an-activity?activity_type={slug}&page={page}"


def scrape_listing_page(url: str) -> list[dict]:
    """Scrape one page of search results and return a list of raw activity dicts."""
    resp = requests.get(url, timeout=15)
    resp.raise_for_status()
    soup = BeautifulSoup(resp.text, "html.parser")

    activities = []

    # mountaineers.org uses class "result-item" or similar — adjust selectors if the site changes
    cards = soup.select("div.result-card, li.result-item, article.activity-card")
    if not cards:
        # Fallback: try to find any structured result block
        cards = soup.select("[class*='result']")

    for card in cards:
        activity = parse_card(card)
        if activity:
            activities.append(activity)

    return activities


def parse_card(card) -> dict | None:
    """Extract fields from a single result card. Returns None if parsing fails."""
    try:
        name_el = card.select_one("h2, h3, .activity-title, .result-title")
        name = name_el.get_text(strip=True) if name_el else None
        if not name:
            return None

        link_el = card.select_one("a[href]")
        activity_url = BASE_URL + link_el["href"] if link_el and link_el["href"].startswith("/") else (link_el["href"] if link_el else BASE_URL)

        location_el = card.select_one(".location, .activity-location, [class*='location']")
        location = location_el.get_text(strip=True) if location_el else "Washington, USA"

        date_el = card.select_one("time, .date, .activity-date, [class*='date']")
        if date_el and date_el.get("datetime"):
            date = datetime.fromisoformat(date_el["datetime"]).replace(tzinfo=timezone.utc)
        elif date_el:
            date = parse_date_text(date_el.get_text(strip=True))
        else:
            date = datetime.now(timezone.utc)

        leaders_el = card.select(".leader, .trip-leader, [class*='leader']")
        leaders = [el.get_text(strip=True) for el in leaders_el] if leaders_el else ["TBD"]

        spots_el = card.select_one(".spots, .availability, [class*='spot']")
        spots_text = spots_el.get_text(strip=True) if spots_el else "0"
        spots = int(re.search(r"\d+", spots_text).group()) if re.search(r"\d+", spots_text) else 0

        image_el = card.select_one("img[src]")
        image_url = image_el["src"] if image_el else ""
        if image_url and image_url.startswith("/"):
            image_url = BASE_URL + image_url

        blurb_el = card.select_one(".blurb, .description, p")
        blurb = blurb_el.get_text(strip=True) if blurb_el else ""

        return {
            "name": name,
            "location": location,
            "leaders": leaders,
            "spotsAvailable": spots,
            "imageURL": image_url,
            "activityURL": activity_url,
            "date": date,
            "blurb": blurb,
        }
    except Exception as exc:
        print(f"  [warn] Failed to parse card: {exc}", file=sys.stderr)
        return None


def parse_date_text(text: str) -> datetime:
    """Try common date formats found on the site."""
    for fmt in ("%B %d, %Y", "%b %d, %Y", "%Y-%m-%d", "%m/%d/%Y"):
        try:
            return datetime.strptime(text.strip(), fmt).replace(tzinfo=timezone.utc)
        except ValueError:
            continue
    return datetime.now(timezone.utc)


def scrape_category(category: str, max_pages: int = 5) -> list[dict]:
    """Scrape up to max_pages of results for a category, attach category metadata."""
    print(f"Scraping: {category}")
    all_activities = []
    icon = CATEGORY_ICONS.get(category, "star.fill")

    for page in range(1, max_pages + 1):
        url = build_search_url(category, page)
        print(f"  Page {page}: {url}")
        try:
            page_activities = scrape_listing_page(url)
        except requests.HTTPError as e:
            print(f"  [stop] HTTP {e.response.status_code} — stopping pagination", file=sys.stderr)
            break

        if not page_activities:
            print(f"  No results on page {page}, stopping.")
            break

        for act in page_activities:
            act["category"] = category
            act["categoryIcon"] = icon

        all_activities.extend(page_activities)
        print(f"  Found {len(page_activities)} activities (total: {len(all_activities)})")

    return all_activities


# ---------------------------------------------------------------------------
# Firebase upload
# ---------------------------------------------------------------------------

def upload_to_firestore(activities: list[dict]) -> None:
    """Upload/merge activities into Firestore collection 'activities'."""
    import firebase_admin
    from firebase_admin import credentials, firestore

    key_path = Path(__file__).parent / "serviceAccountKey.json"
    if not key_path.exists():
        print(f"ERROR: service account key not found at {key_path}", file=sys.stderr)
        sys.exit(1)

    if not firebase_admin._apps:
        cred = credentials.Certificate(str(key_path))
        firebase_admin.initialize_app(cred)

    db = firestore.client()
    collection = db.collection("activities")

    batch = db.batch()
    count = 0

    for act in activities:
        # Use a stable doc ID so re-runs update rather than duplicate
        doc_id = _stable_id(act)
        doc_ref = collection.document(doc_id)

        # Convert datetime → Firestore Timestamp
        payload = {**act, "date": act["date"]}

        batch.set(doc_ref, payload, merge=True)
        count += 1

        # Firestore batches max out at 500 writes
        if count % 500 == 0:
            batch.commit()
            batch = db.batch()
            print(f"  Committed {count} documents…")

    batch.commit()
    print(f"Uploaded {count} activities to Firestore.")


def _stable_id(act: dict) -> str:
    """Generate a stable document ID from name + date so re-scrapes are idempotent."""
    date_str = act["date"].strftime("%Y%m%d") if isinstance(act["date"], datetime) else "nodate"
    slug = re.sub(r"[^a-z0-9]+", "-", act["name"].lower()).strip("-")
    return f"{slug}-{date_str}"[:100]


# ---------------------------------------------------------------------------
# CLI
# ---------------------------------------------------------------------------

ALL_CATEGORIES = list(CATEGORY_ICONS.keys())


def main() -> None:
    parser = argparse.ArgumentParser(description="Scrape Mountaineers activities and upload to Firestore.")
    parser.add_argument("--category", help="Scrape a single category (default: all)")
    parser.add_argument("--max-pages", type=int, default=5, help="Max pages per category (default: 5)")
    parser.add_argument("--dry-run", action="store_true", help="Print results without uploading")
    args = parser.parse_args()

    categories = [args.category] if args.category else ALL_CATEGORIES
    all_activities: list[dict] = []

    for category in categories:
        all_activities.extend(scrape_category(category, max_pages=args.max_pages))

    print(f"\nTotal activities scraped: {len(all_activities)}")

    if args.dry_run:
        for act in all_activities[:5]:
            print(json.dumps(
                {k: str(v) if isinstance(v, datetime) else v for k, v in act.items()},
                indent=2,
            ))
        print("(dry run — not uploading)")
    else:
        upload_to_firestore(all_activities)


if __name__ == "__main__":
    main()
