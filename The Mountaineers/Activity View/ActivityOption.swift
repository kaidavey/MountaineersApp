//
//  ActivityOption.swift
//  The Mountaineers
//

import Foundation
import SwiftUI
import SwiftData

@Model
class ActivityOption: Identifiable {
    var id: UUID = UUID()
    var name: String
    var location: String
    var leaders: [String]
    var spotsAvailable: Int
    var category: String
    var categoryIcon: String
    var imageURL: String
    var activityURL: String
    var blurb: String
    var date: Date

    init(from activity: Activity) {
        self.name = activity.name
        self.location = activity.location
        self.leaders = activity.leaders
        self.spotsAvailable = activity.spotsAvailable
        self.category = activity.category
        self.categoryIcon = activity.categoryIcon
        self.imageURL = activity.imageURL
        self.activityURL = activity.activityURL
        self.blurb = activity.blurb
        self.date = activity.date
    }

    func toActivity() -> Activity {
        Activity(
            id: id.uuidString,
            name: name,
            location: location,
            leaders: leaders,
            spotsAvailable: spotsAvailable,
            category: category,
            categoryIcon: categoryIcon,
            imageURL: imageURL,
            activityURL: activityURL,
            date: date,
            blurb: blurb
        )
    }
}
