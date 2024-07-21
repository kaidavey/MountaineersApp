//
//  The_MountaineersApp.swift
//  The Mountaineers
//

import SwiftUI
import SwiftData

@main
struct The_MountaineersApp: App {
    @StateObject var loginManager = LoginManager()
    @State var showSplash = false
    
    var body: some Scene {
        WindowGroup {
            if loginManager.hasStoredData() {
                MainView()
                    .environmentObject(loginManager)
            } else {
                LoginView()
                    .environmentObject(loginManager)
            }
        }
    }
}
