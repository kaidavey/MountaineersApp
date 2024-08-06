//
//  ViewExtensions.swift
//  The Mountaineers
//

import Foundation
import SwiftUI

extension View {
    @ViewBuilder
    
    func isSameDate(_ date1: Date, _ date2: Date) -> Bool {
        return Calendar.current.isDate(date1, inSameDayAs: date2)
    }
}
