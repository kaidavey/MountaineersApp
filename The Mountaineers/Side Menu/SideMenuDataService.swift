//
//  SideMenuOptionModel.swift
//  The Mountaineers
//

import Foundation
import SwiftUI

struct SideMenuDataService {
    static func getData() -> [SideMenuOption] {
        return [SideMenuOption(name: "HOME", isFontLarge: true, view: AnyView(HomeView())),
                SideMenuOption(name: "", isFontLarge: false, view: AnyView(EmptyView())),
                SideMenuOption(name: "EXPLORE", isFontLarge: true, view: AnyView(ExploreView())),
                SideMenuOption(name: "Activities", isFontLarge: false, view: AnyView(ActivitiesView())),
                SideMenuOption(name: "Courses", isFontLarge: false, view: AnyView(CoursesView())),
                SideMenuOption(name: "", isFontLarge: false, view: AnyView(EmptyView())),
                SideMenuOption(name: "CONSERVATION", isFontLarge: true, view: AnyView(ConservationView())),
                SideMenuOption(name: "", isFontLarge: false, view: AnyView(EmptyView())),
                SideMenuOption(name: "VOLUNTEER", isFontLarge: true, view: AnyView(VolunteerView())),
                SideMenuOption(name: "", isFontLarge: false, view: AnyView(EmptyView())),
                SideMenuOption(name: "ABOUT", isFontLarge: true, view: AnyView(AboutView()))]
    }
}
