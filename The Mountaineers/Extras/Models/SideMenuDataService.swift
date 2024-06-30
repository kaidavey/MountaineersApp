//
//  SideMenuOptionModel.swift
//  The Mountaineers
//

import Foundation

struct SideMenuDataService {
    static func getData() -> [SideMenuOption] {
        return [SideMenuOption(name: "HOME", isFontLarge: true),
                SideMenuOption(name: "Activities", isFontLarge: false),
                SideMenuOption(name: "Courses", isFontLarge: false),
                SideMenuOption(name: "CONSERVATION", isFontLarge: true),
                SideMenuOption(name: "VOLUNTEER", isFontLarge: true),
                SideMenuOption(name: "YOUTH", isFontLarge: true),
                SideMenuOption(name: "MEMBERSHIP", isFontLarge: true),
                SideMenuOption(name: "Locations", isFontLarge: false),
                SideMenuOption(name: "Lodges", isFontLarge: false),
                SideMenuOption(name: "EVENTS", isFontLarge: true),
                SideMenuOption(name: "BLOG", isFontLarge: true),
                SideMenuOption(name: "ABOUT", isFontLarge: true)]
    }
}
