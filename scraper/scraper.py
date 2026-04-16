"""
scraper.py — Mountaineers activity scraper
Scrapes upcoming activities from mountaineers.org and uploads them to Firebase Firestore.
Uses Playwright to handle JavaScript-rendered content.

SETUP:
  pip3 install playwright firebase-admin
  python3 -m playwright install chromium

  Place your Firebase service account key JSON at scraper/serviceAccountKey.json
  (download from Firebase Console > Project Settings > Service Accounts > Generate new private key)

USAGE:
  python3 scraper.py --dry-run              # print results, don't upload
  python3 scraper.py                        # scrape all categories and upload
  python3 scraper.py --category "Day Hiking"  # one category only
"""

import argparse
import json
import re
import sys
from datetime import datetime, timezone
from pathlib import Path
from typing import Optional

# ---------------------------------------------------------------------------
# Category config — keys are the c4= filter values used by mountaineers.org
# ---------------------------------------------------------------------------
CATEGORIES = {
    "Backcountry Skiing":       {"icon": "skis.fill",                       "app_category": "Backcountry Skiing"},
    "Bikepacking":              {"icon": "bicycle",                         "app_category": "Bikepacking"},
    "Canyoning":                {"icon": "water.waves",                     "app_category": "Canyoning"},
    "Climbing":                 {"icon": "figure.climbing",                 "app_category": "Climbing"},
    "Cross Country Skiing":     {"icon": "figure.skiing.crosscountry",      "app_category": "Cross-country Skiing"},
    "Day Hiking":               {"icon": "figure.hiking",                   "app_category": "Hiking & Backpacking"},
    "Backpacking":              {"icon": "figure.hiking",                   "app_category": "Hiking & Backpacking"},
    "Mountaineering":           {"icon": "mountain.2.fill",                 "app_category": "Scrambling"},
    "Naturalist":               {"icon": "leaf.fill",                       "app_category": "Naturalist"},
    "Night Sky":                {"icon": "moon.stars.fill",                 "app_category": "Night Sky"},
    "Packrafting":              {"icon": "ferry.fill",                      "app_category": "Packrafting"},
    "Photography":              {"icon": "camera.fill",                     "app_category": "Photography"},
    "Sailing":                  {"icon": "sailboat.fill",                   "app_category": "Sailing"},
    "Scrambling":               {"icon": "mountain.2.fill",                 "app_category": "Scrambling"},
    "Sea Kayaking":             {"icon": "figure.open.water.swim",          "app_category": "Sea Kayaking"},
    "Snowshoeing":              {"icon": "snowflake",                       "app_category": "Snowshoeing"},
    "Stewardship":              {"icon": "hand.raised.fill",                "app_category": "Stewardship"},
    "Trail Running":            {"icon": "figure.run",                      "app_category": "Trail Running"},
    "Urban Hike":               {"icon": "figure.walk.circle.fill",         "app_category": "Urban Walks & Adventures"},
    "Youth":                    {"icon": "figure.2.and.child.holdinghands", "app_category": "Youth & Family"},
}

BASE_URL = "https://www.mountaineers.org"
SEARCH_URL = f"{BASE_URL}/activities/activities"


# ---------------------------------------------------------------------------
# Playwright scraping
# ---------------------------------------------------------------------------

def scrape_all(categories: list[str], max_per_category: int = 50) -> list[dict]:
    from playwright.sync_api import sync_playwright

    all_activities = []

    with sync_playwright() as p:
        browser = p.chromium.launch(headless=True)
        page = browser.new_page()

        for cat in categories:
            config = CATEGORIES[cat]
            print(f"\nScraping: {cat}")
            url = f"{SEARCH_URL}?c4={cat.replace(' ', '+')}"
            print(f"  URL: {url}")

            try:
                page.goto(url, wait_until="networkidle", timeout=30000)
            except Exception as e:
                print(f"  [warn] Page load failed: {e}", file=sys.stderr)
                continue

            # Wait for results to render — adjust selector if needed after inspecting the live site
            try:
                page.wait_for_selector("ul.searchResults li, .search-results li, li.tileItem", timeout=10000)
            except Exception:
                print("  [warn] No results selector found — dumping visible text for debugging:")
                print("  ", page.inner_text("body")[:500])
                continue

            items = page.query_selector_all("ul.searchResults li, .search-results li, li.tileItem")
            print(f"  Found {len(items)} items")

            for item in items[:max_per_category]:
                activity = parse_item(item, config)
                if activity:
                    all_activities.append(activity)

        browser.close()

    return all_activities


def parse_item(item, config: dict) -> Optional[dict]:
    """Extract fields from a single rendered result item."""
    try:
        # Title / name
        name_el = item.query_selector("a.summary, h2 a, h3 a, .title a, a")
        name = name_el.inner_text().strip() if name_el else None
        if not name:
            return None

        # Activity URL
        href = name_el.get_attribute("href") if name_el else ""
        if href and href.startswith("/"):
            activity_url = BASE_URL + href
        else:
            activity_url = href or BASE_URL

        # Date
        date_el = item.query_selector("span.date, .event-date, time, [class*='date']")
        date_text = date_el.inner_text().strip() if date_el else ""
        date = parse_date(date_text)

        # Location
        loc_el = item.query_selector("[class*='location'], [class*='branch'], .branch")
        location = loc_el.inner_text().strip() if loc_el else "Washington, USA"

        # Leaders
        leader_els = item.query_selector_all("[class*='leader'], [class*='Leader']")
        leaders = [el.inner_text().strip() for el in leader_els] if leader_els else ["TBD"]

        # Spots available
        spots_el = item.query_selector("[class*='spot'], [class*='opening'], [class*='availability']")
        spots_text = spots_el.inner_text().strip() if spots_el else ""
        match = re.search(r"\d+", spots_text)
        spots = int(match.group()) if match else 0

        # Image
        img_el = item.query_selector("img[src]")
        image_url = ""
        if img_el:
            src = img_el.get_attribute("src") or ""
            image_url = (BASE_URL + src) if src.startswith("/") else src

        # Blurb
        blurb_el = item.query_selector("p, .description, [class*='description']")
        blurb = blurb_el.inner_text().strip() if blurb_el else ""

        return {
            "name": name,
            "location": location,
            "leaders": leaders,
            "spotsAvailable": spots,
            "category": config["app_category"],
            "categoryIcon": config["icon"],
            "imageURL": image_url,
            "activityURL": activity_url,
            "date": date,
            "blurb": blurb,
        }
    except Exception as exc:
        print(f"  [warn] Failed to parse item: {exc}", file=sys.stderr)
        return None


def parse_date(text: str) -> datetime:
    for fmt in ("%B %d, %Y", "%b %d, %Y", "%Y-%m-%d", "%m/%d/%Y", "%b. %d, %Y"):
        try:
            return datetime.strptime(text.strip(), fmt).replace(tzinfo=timezone.utc)
        except ValueError:
            continue
    return datetime.now(timezone.utc)


# ---------------------------------------------------------------------------
# Firebase upload
# ---------------------------------------------------------------------------

def upload_to_firestore(activities: list[dict]) -> None:
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
        doc_id = _stable_id(act)
        doc_ref = collection.document(doc_id)
        batch.set(doc_ref, act, merge=True)
        count += 1
        if count % 500 == 0:
            batch.commit()
            batch = db.batch()
            print(f"  Committed {count} documents…")

    batch.commit()
    print(f"\nUploaded {count} activities to Firestore.")


def _stable_id(act: dict) -> str:
    date_str = act["date"].strftime("%Y%m%d") if isinstance(act["date"], datetime) else "nodate"
    slug = re.sub(r"[^a-z0-9]+", "-", act["name"].lower()).strip("-")
    return f"{slug}-{date_str}"[:100]


# ---------------------------------------------------------------------------
# CLI
# ---------------------------------------------------------------------------

def main() -> None:
    parser = argparse.ArgumentParser(description="Scrape Mountaineers activities → Firestore.")
    parser.add_argument("--category", help=f"Scrape one category. Options: {', '.join(CATEGORIES)}")
    parser.add_argument("--max", type=int, default=50, help="Max activities per category (default: 50)")
    parser.add_argument("--dry-run", action="store_true", help="Print results without uploading")
    args = parser.parse_args()

    if args.category and args.category not in CATEGORIES:
        print(f"Unknown category '{args.category}'. Options:\n  " + "\n  ".join(CATEGORIES), file=sys.stderr)
        sys.exit(1)

    categories = [args.category] if args.category else list(CATEGORIES.keys())
    all_activities = scrape_all(categories, max_per_category=args.max)

    print(f"\nTotal activities scraped: {len(all_activities)}")

    if args.dry_run:
        for act in all_activities[:5]:
            print(json.dumps(
                {k: str(v) if isinstance(v, datetime) else v for k, v in act.items()},
                indent=2,
            ))
        if not all_activities:
            print("No activities found — the CSS selectors may need adjustment.")
            print("Run without --dry-run after inspecting the live site in DevTools.")
        else:
            print(f"\n(showing first 5 of {len(all_activities)} — not uploading)")
    else:
        upload_to_firestore(all_activities)


if __name__ == "__main__":
    main()
