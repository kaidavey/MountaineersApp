//
//  The_MountaineersApp.swift
//  The Mountaineers
//

import SwiftUI
import SwiftData

@main
struct The_MountaineersApp: App {
    @StateObject var loginManager = LoginManager()
    @StateObject var upcomingManager = UpcomingManager()
    
    var body: some Scene {
        WindowGroup {
            if loginManager.hasStoredData() {
                MainView()
                    .environmentObject(loginManager)
                    .environmentObject(upcomingManager)
            } else {
                LoginView()
                    .environmentObject(loginManager)
            }
        }
        .modelContainer(for: ActivityOption.self)
    }
}
