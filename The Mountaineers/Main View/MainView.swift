//
//  MainView.swift
//  The Mountaineers
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var loginManager: LoginManager
    @EnvironmentObject var upcomingManager: UpcomingManager
    @State private var showMenu = false
    @State private var showUpcoming = false
    @State private var selectedTab: SideMenuOption = SideMenuDataService.getData()[0]
    
    var body: some View {
        ZStack {
            ForEach(SideMenuDataService.getData()) { option in
                if option.name == selectedTab.name {
                    option.view
                        .environmentObject(upcomingManager)
                        .padding(.top, 40)
                }
            }
            
            UpcomingView(isShowing: $showUpcoming)
                .environmentObject(upcomingManager)
            
            VStack {
                Rectangle()
                    .ignoresSafeArea()
                    .foregroundStyle(.charcoal)
                    .frame(height: 40)
                    .overlay {
                        if showUpcoming {
                            Text("UPCOMING")
                                .font(.custom("Tahoma-Bold", size: 18))
                                .foregroundStyle(.lightBlue)
                        } else {
                            Text(selectedTab.name.uppercased())
                                .font(.custom("Tahoma-Bold", size: 18))
                                .foregroundStyle(.lightBlue)
                        }
                    }
                    .overlay(alignment: .leading) {
                        if !showUpcoming {
                            Button {
                                showMenu.toggle()
                            } label: {
                                Image(systemName: "line.horizontal.3")
                                    .imageScale(.large)
                                    .fontWeight(.bold)
                                    .foregroundStyle(.lightBlue)
                                    .padding()
                            }
                        }
                        
                    }
                    .overlay(alignment: .trailing) {
                        Button {
                            showUpcoming.toggle()
                        } label: {
                            if showUpcoming {
                                Image(systemName: "xmark")
                                    .imageScale(.large)
                                    .fontWeight(.bold)
                                    .foregroundStyle(.lightBlue)
                            } else {
                                Image(systemName: "calendar")
                                    .imageScale(.large)
                                    .foregroundStyle(.lightBlue)
                            }
                        }
                        .padding()
                    }
                
                Spacer()
            }
            
            SideMenuView(isShowing: $showMenu, selectedTab: $selectedTab)
                .environmentObject(loginManager)
        }
    }
}

