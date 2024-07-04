//
//  HomeView.swift
//  The Mountaineers
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var loginManager: LoginManager
    @State private var showMenu = false
    @State private var selectedTab: SideMenuOption = SideMenuDataService.getData()[0]
    
    var body: some View {
        let arr: [SideMenuOption] = SideMenuDataService.getData()
        
        NavigationStack {
            ZStack {
                Color(.systemGray4)
                    .opacity(0.8)
                    .ignoresSafeArea()
                VStack {
                    Rectangle()
                        .ignoresSafeArea()
                        .frame(height: 50)
                        .foregroundStyle(.darkGreen)
                        .overlay(
                            HStack {
                                Text("GET OUTSIDE WITH US")
                                    .font(.custom("Tahoma-Bold", size: 26))
                                    .foregroundStyle(.white)
                                    .padding(.leading, 10)
                                
                                Spacer()
                            }
                        )
                    
                    Spacer()
                    
                    SubHomeView()
                }
                
                SideMenuView(isShowing: $showMenu, selectedTab: $selectedTab, selectedTitle: arr[0])
                    .environmentObject(loginManager)
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        showMenu.toggle()
                    }, label: {
                        Image(systemName: "line.3.horizontal")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    })
                    .opacity(showMenu ? 0 : 1)
                }
            }
            .toolbarBackground(.hidden)
        }
    }
}

