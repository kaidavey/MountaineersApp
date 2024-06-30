//
//  The_MountaineersApp.swift
//  The Mountaineers
//

import SwiftUI
import SwiftData

@main
struct The_MountaineersApp: App {
    
    @StateObject var loginManager = LoginManager()
    
    var body: some Scene {
        WindowGroup {
            if loginManager.hasStoredData() {
                HomeView()
                    .environmentObject(loginManager)
            } else {
                LoginView()
                    .environmentObject(loginManager)
            }
        }
    }
}
