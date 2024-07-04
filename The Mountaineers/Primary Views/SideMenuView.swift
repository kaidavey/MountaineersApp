//
//  SideMenuView.swift
//  The Mountaineers
//

import SwiftUI

struct SideMenuView: View {
    
    @EnvironmentObject var loginManager: LoginManager
    @Binding var isShowing: Bool
    @Binding var selectedTab: SideMenuOption
    @State var selectedTitle: SideMenuOption
    
    var body: some View {
        NavigationStack {
            ZStack {
                if isShowing {
                    Rectangle()
                        .opacity(0.3)
                        .ignoresSafeArea()
                        .onTapGesture {
                            isShowing.toggle()
                        }
                    
                    HStack {
                        VStack(alignment: .leading, spacing: 20) {
                            Image("logo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60)
                            
                            let titleData: [SideMenuOption] = SideMenuDataService.getData()
                            
                            VStack {
                                ForEach(titleData) { option in
                                    if option.name.count > 0 {
                                        Button {
                                            selectedTitle = option
                                            isShowing = false
                                            selectedTab = option
                                        } label: {
                                            SideMenuRow(option: option, selectedTitle: $selectedTitle)
                                        }
                                    } else {
                                        SideMenuRow(option: option, selectedTitle: $selectedTitle)
                                    }
                                }
                            }
                            
                            Spacer()
                            
                            SideMenuFooter()
                                .environmentObject(loginManager)
                        }
                        .padding(.leading, 20)
                        .frame(width: 250, alignment: .leading)
                        .background(.darkGray)
                        
                        Spacer()
                    }
                    .transition(.move(edge: .leading))
                    .animation(.linear, value: isShowing)
                }
            }
            .transition(.move(edge: .leading))
            .animation(.linear, value: isShowing)
        }
    }
}

