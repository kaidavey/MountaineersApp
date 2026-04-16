//
//  ActivityService.swift
//  The Mountaineers
//
//  Fetches activities from Firebase Firestore.
//
//  SETUP REQUIRED:
//  1. Add Firebase iOS SDK via Swift Package Manager:
//     File > Add Package Dependencies > https://github.com/firebase/firebase-ios-sdk
//     Include: FirebaseFirestore
//  2. Add GoogleService-Info.plist to the project (download from Firebase Console)
//  3. Initialize Firebase in The_MountaineersApp.swift:
//       import FirebaseCore
//       FirebaseApp.configure()   ← call this in init()
//

import Foundation
import FirebaseFirestore

@MainActor
class ActivityService: ObservableObject {
    @Published var activities: [Activity] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    private let db = Firestore.firestore()

    // Fetch all activities for a given category (matches the tile label from ActivitiesView)
    func fetchActivities(for category: String) async {
        isLoading = true
        errorMessage = nil

        do {
            let snapshot = try await db
                .collection("activities")
                .whereField("category", isEqualTo: category)
                .order(by: "date")
                .getDocuments()

            activities = snapshot.documents.compactMap { doc in
                try? doc.data(as: FirestoreActivity.self).toActivity(id: doc.documentID)
            }
        } catch {
            errorMessage = "Failed to load activities: \(error.localizedDescription)"
        }

        isLoading = false
    }
}

// MARK: - Firestore-compatible intermediate type
// Firestore stores dates as Timestamps; this bridges the gap.
private struct FirestoreActivity: Codable {
    var name: String
    var location: String
    var leaders: [String]
    var spotsAvailable: Int
    var category: String
    var categoryIcon: String
    var imageURL: String
    var activityURL: String
    var date: Date
    var blurb: String

    func toActivity(id: String) -> Activity {
        Activity(
            id: id,
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
