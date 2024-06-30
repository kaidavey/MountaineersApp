//
//  HomeView.swift
//  The Mountaineers
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var loginManager: LoginManager
    @State private var showMenu = false
    @State private var selectedTab = 0
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemGray4).ignoresSafeArea()
                
                TabView(selection: $selectedTab) {
                    
                }
                .hidden()
                
                SideMenuView(isShowing: $showMenu, selectedTitle: SideMenuOption(name: "HOME", isFontLarge: true))
                    .environmentObject(loginManager)
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        showMenu.toggle()
                    }, label: {
                        Image(systemName: "line.3.horizontal")
                            .fontWeight(.bold)
                            .foregroundColor(.darkBlue)
                    })
                    .opacity(showMenu ? 0 : 1)
                }
            }
        }
    }
}

