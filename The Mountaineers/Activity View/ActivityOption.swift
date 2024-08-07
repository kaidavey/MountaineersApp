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
    var image: String
    var blurb: String
    var date: Date
    
    init(id: UUID = UUID(), name: String, image: String, blurb: String, date: Date = Date()) {
        self.id = id
        self.name = name
        self.image = image
        self.blurb = blurb
        self.date = date
    }
}
