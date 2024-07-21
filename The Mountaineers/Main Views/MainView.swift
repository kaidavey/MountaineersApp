//
//  MainView.swift
//  The Mountaineers
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var loginManager: LoginManager
    @State private var showMenu = false
    @State private var showCart = false
    @State private var selectedTab: SideMenuOption = SideMenuDataService.getData()[0]
    
    var body: some View {
        ZStack {            
            ForEach(SideMenuDataService.getData()) { option in
                if option.name == selectedTab.name {
                    option.view
                        .padding(.top, 40)
                }
            }
            
            CartView(isShowing: $showCart)
                .padding(.top, 40)
            
            VStack {
                Rectangle()
                    .ignoresSafeArea()
                    .foregroundStyle(.darkGray)
                    .frame(height: 40)
                
                Spacer()
            }
            
            if !showCart {
                Button {
                    showMenu.toggle()
                } label: {
                    Image(systemName: "line.horizontal.3")
                        .imageScale(.large)
                        .fontWeight(.bold)
                        .foregroundStyle(.lightBlue)
                }
                .padding()
                .position(x: 30, y: 20)
            }

            Button {
                showCart.toggle()
            } label: {
                if showCart {
                    Image(systemName: "xmark")
                        .imageScale(.large)
                        .fontWeight(.bold)
                        .foregroundStyle(.lightBlue)
                } else {
                    Image(systemName: "cart.fill")
                        .imageScale(.large)
                        .foregroundStyle(.lightBlue)
                }
            }
            .padding()
            .position(x: 360, y: 20)
            
            SideMenuView(isShowing: $showMenu, selectedTab: $selectedTab)
                .environmentObject(loginManager)
        }
    }
}

