//
//  MainView.swift
//  The Mountaineers
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var loginManager: LoginManager
    @State private var showMenu = false
    @State private var selectedTab: SideMenuOption = SideMenuDataService.getData()[0]
    
    var body: some View {
        ZStack {            
            ForEach(SideMenuDataService.getData()) { option in
                if option.name == selectedTab.name {
                    option.view
                }
            }
                
            SideMenuView(isShowing: $showMenu, selectedTab: $selectedTab)
                .environmentObject(loginManager)
                .zIndex(1)
            
            Button {
                showMenu.toggle()
            } label: {
                    Image(systemName: "line.horizontal.3")
                    .imageScale(.large)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
            }
            .padding()
            .position(x: 30, y: 20)
        }
    }
}

