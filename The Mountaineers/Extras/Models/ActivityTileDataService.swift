//
//  SubHomeActivityTileDataService.swift
//  The Mountaineers
//
//  Created by Hong Huang on 7/2/24.
//

import Foundation
import SwiftUI

struct ActivityTileDataService {
    static func getData() -> [ActivityTileView] {
        return [ActivityTileView(text: "Backcountry Skiing", imageName: "backcountry-skiing", view: AnyView(BackcountrySkiView())),
                ActivityTileView(text: "Bikepacking", imageName: "bikepacking", view: AnyView(BikepackingView())),
                ActivityTileView(text: "Canyoning", imageName: "canyoning", view: AnyView(CanyoningView())),
                ActivityTileView(text: "Climbing", imageName: "climbing", view: AnyView(ClimbingView())),
                ActivityTileView(text: "Cross-country Skiing", imageName: "xc-skiing", view: AnyView(XCSkiView())),
                ActivityTileView(text: "Global Adventures", imageName: "global-adventures", view: AnyView(GlobalAdventuresView())),
                ActivityTileView(text: "Hiking & Backpacking", imageName: "hike-backpack", view: AnyView(HikeBackpackView())),
                ActivityTileView(text: "Naturalist", imageName: "naturalist", view: AnyView(NaturalistView())),
                ActivityTileView(text: "Night Sky", imageName: "night-sky", view: AnyView(NightSkyView())),
                ActivityTileView(text: "Packrafting", imageName: "packrafting", view: AnyView(PackraftingView())),
                ActivityTileView(text: "Photography", imageName: "photography", view: AnyView(PhotographyView())),
                ActivityTileView(text: "Sailing", imageName: "sailing", view: AnyView(SailingView())),
                ActivityTileView(text: "Scrambling", imageName: "scrambling", view: AnyView(ScramblingView())),
                ActivityTileView(text: "Sea Kayaking", imageName: "sea-kayaking", view: AnyView(SeaKayakingView())),
                ActivityTileView(text: "Snowshoeing", imageName: "snowshoe", view: AnyView(SnowshoeingView())),
                ActivityTileView(text: "Stewardship", imageName: "steward", view: AnyView(StewardshipView())),
                ActivityTileView(text: "Trail Running", imageName: "trail-run", view: AnyView(TrailRunningView())),
                ActivityTileView(text: "Urban Walks & Adventures", imageName: "urban-walk-adventures", view: AnyView(UrbanWalkAdventuresView())),
                ActivityTileView(text: "Youth & Family", imageName: "youth-family", view: AnyView(YouthFamilyView()))]
    }
}
