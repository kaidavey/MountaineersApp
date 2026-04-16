//
//  The_MountaineersApp.swift
//  The Mountaineers
//

import SwiftUI
import SwiftData
import FirebaseCore

@main
struct The_MountaineersApp: App {
    @StateObject var loginManager = LoginManager()
    @StateObject var upcomingManager = UpcomingManager()
    

    init() { FirebaseApp.configure() }

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
