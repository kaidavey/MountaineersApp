//
//  SubHomeActivityTileDataService.swift
//  The Mountaineers
//

import Foundation
import SwiftUI

struct ActivityTileDataService {
    static func getData() -> [ActivityTileView] {
        return [ActivityTileView(text: "Backcountry Skiing", imageName: "backcountry-skiing", viewOption: 1),
                ActivityTileView(text: "Bikepacking", imageName: "bikepacking", viewOption: 1),
                ActivityTileView(text: "Canyoning", imageName: "canyoning", viewOption: 1),
                ActivityTileView(text: "Climbing", imageName: "climbing", viewOption: 1),
                ActivityTileView(text: "Cross-country Skiing", imageName: "xc-skiing", viewOption: 1),
                ActivityTileView(text: "Global Adventures", imageName: "global-adventures", viewOption: 1),
                ActivityTileView(text: "Hiking & Backpacking", imageName: "hike-backpack", viewOption: 1),
                ActivityTileView(text: "Naturalist", imageName: "naturalist", viewOption: 1),
                ActivityTileView(text: "Night Sky", imageName: "night-sky", viewOption: 1),
                ActivityTileView(text: "Packrafting", imageName: "packrafting", viewOption: 1),
                ActivityTileView(text: "Photography", imageName: "photography", viewOption: 1),
                ActivityTileView(text: "Sailing", imageName: "sailing", viewOption: 1),
                ActivityTileView(text: "Scrambling", imageName: "scrambling", viewOption: 1),
                ActivityTileView(text: "Sea Kayaking", imageName: "sea-kayaking", viewOption: 1),
                ActivityTileView(text: "Snowshoeing", imageName: "snowshoe", viewOption: 1),
                ActivityTileView(text: "Stewardship", imageName: "steward", viewOption: 1),
                ActivityTileView(text: "Trail Running", imageName: "trail-run", viewOption: 1),
                ActivityTileView(text: "Urban Walks & Adventures", imageName: "urban-walk-adventures", viewOption: 1),
                ActivityTileView(text: "Youth & Family", imageName: "youth-family", viewOption: 1)]
    }
}
