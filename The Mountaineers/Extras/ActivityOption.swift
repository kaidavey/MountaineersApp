//
//  ActivityOption.swift
//  The Mountaineers
//

import Foundation
import SwiftUI

struct ActivityOption: Identifiable {
    var id: UUID = UUID()
    var name: String
    var image: String
    var description: String
    var rating: Int
}
