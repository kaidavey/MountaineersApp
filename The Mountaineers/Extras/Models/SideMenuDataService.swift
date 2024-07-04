//
//  SideMenuOptionModel.swift
//  The Mountaineers
//

import Foundation
import SwiftUI

struct SideMenuDataService {
    static func getData() -> [SideMenuOption] {
        return [SideMenuOption(name: "HOME", isFontLarge: true, view: AnyView(EmptyView())),
                SideMenuOption(name: "Activities", isFontLarge: false, view: AnyView(ActivitiesView())),
                SideMenuOption(name: "Courses", isFontLarge: false, view: AnyView(CoursesView())),
                SideMenuOption(name: "", isFontLarge: false, view: AnyView(EmptyView())),
                SideMenuOption(name: "CONSERVATION", isFontLarge: true, view: AnyView(ConservationView())),
                SideMenuOption(name: "", isFontLarge: false, view: AnyView(EmptyView())),
                SideMenuOption(name: "VOLUNTEER", isFontLarge: true, view: AnyView(VolunteerView())),
                SideMenuOption(name: "", isFontLarge: false,view: AnyView(EmptyView())),
                SideMenuOption(name: "YOUTH", isFontLarge: true, view: AnyView(YouthView())),
                SideMenuOption(name: "", isFontLarge: false, view: AnyView(EmptyView())),
                SideMenuOption(name: "MEMBERSHIP", isFontLarge: true, view: AnyView(MembershipView())),
                SideMenuOption(name: "Locations", isFontLarge: false, view: AnyView(LocationsView())),
                SideMenuOption(name: "Lodges", isFontLarge: false, view: AnyView(LodgesView())),
                SideMenuOption(name: "", isFontLarge: false, view: AnyView(EmptyView())),
                SideMenuOption(name: "EVENTS", isFontLarge: true, view: AnyView(EventsView())),
                SideMenuOption(name: "", isFontLarge: false, view: AnyView(EmptyView())),
                SideMenuOption(name: "BLOG", isFontLarge: true, view: AnyView(BlogView())),
                SideMenuOption(name: "", isFontLarge: false, view: AnyView(EmptyView())),
                SideMenuOption(name: "ABOUT", isFontLarge: true, view: AnyView(AboutView()))]
    }
}
