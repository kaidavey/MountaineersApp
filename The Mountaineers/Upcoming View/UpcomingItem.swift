//
//  UpcomingItem.swift
//  The Mountaineers
//

import Foundation
import SwiftUI

struct UpcomingItem: Identifiable {
    var id: UUID = UUID()
    var title: String
    var description: String
    var date: Date = Date()
    var hasHappened = false
    var tint: Color
}

extension Date {
    static func updateHour(_ value: Int) -> Date {
        let calendar = Calendar.current
        return calendar.date(byAdding: .hour, value: value, to: .init()) ?? .init()
    }
}
