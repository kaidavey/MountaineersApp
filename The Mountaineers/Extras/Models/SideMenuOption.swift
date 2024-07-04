//
//  SideMenuOption.swift
//  The Mountaineers
//

import Foundation
import SwiftUI

struct SideMenuOption: Identifiable {
    var id: UUID = UUID()
    var name: String
    var isFontLarge: Bool
    var view: AnyView
}
