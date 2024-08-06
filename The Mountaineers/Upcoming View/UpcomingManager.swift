//
//  CartManager.swift
//  The Mountaineers
//

import Foundation
import SwiftUI
import SwiftData

class UpcomingManager: ObservableObject {
    @Published private(set) var activities: [ActivityOption] = []
    
    func addActivity(item: ActivityOption) {
        activities.append(item)
    }
    
    func removeActivity(item: ActivityOption) {
        if let index = activities.firstIndex(where: { $0.id == item.id}) {
            activities.remove(at:index)
        }
    }
    
    func getActivities() -> [ActivityOption] {
        return activities
    }
}
