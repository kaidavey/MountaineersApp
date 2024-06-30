//
//  HomeView.swift
//  The Mountaineers
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var loginManager: LoginManager
    @State private var showMenu = false

    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemGray4).ignoresSafeArea()
                
                SideMenuView(isShowing: $showMenu, selectedOption: SideMenuOption(name: "HOME", isFontLarge: true))
                    .environmentObject(loginManager)
            }
            .toolbar(showMenu ? .hidden : .visible, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        showMenu.toggle()
                    }, label: {
                        Image(systemName: "line.3.horizontal")
                            .fontWeight(.bold)
                            .foregroundColor(.darkBlue)
                    })
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
