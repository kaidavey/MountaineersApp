//
//  CartManager.swift
//  The Mountaineers
//

import Foundation
import SwiftUI
import SwiftData

class UpcomingManager: ObservableObject {
    @Published private(set) var activities: [ActivityOption] = []
    @Published private(set) var courses: [CourseOption] = []
    
    func addActivity(item: ActivityOption) {
        activities.append(item)
    }
    
    func removeFromOrder(item: ActivityOption) {
        if let index = activities.firstIndex(where: { $0.id == item.id}) {
            activities.remove(at:index)
        }
    }
    
    func getActivities() -> [ActivityOption] {
        return activities
    }
}
