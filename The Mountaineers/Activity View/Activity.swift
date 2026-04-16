//
//  Activity.swift
//  The Mountaineers
//
//  Remote activity model fetched from Firebase Firestore.
//

import Foundation

struct Activity: Identifiable, Codable {
    var id: String
    var name: String
    var location: String
    var leaders: [String]
    var spotsAvailable: Int
    var category: String
    var categoryIcon: String   // SF Symbol name e.g. "skis.fill", "figure.hiking"
    var imageURL: String       // Remote image URL from mountaineers.org
    var activityURL: String    // Link back to the listing page
    var date: Date
    var blurb: String

    // Comma-separated leaders for display: "Matt D., Veronica H."
    var leadersDisplay: String {
        leaders.joined(separator: ", ")
    }
}
