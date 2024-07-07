//
//  SideMenuView.swift
//  The Mountaineers
//

import SwiftUI

struct SideMenuView: View {
    @EnvironmentObject var loginManager: LoginManager
    @Binding var isShowing: Bool
    @Binding var selectedTab: SideMenuOption
    @ObservedObject var globalVariables = GlobalVariables.shared
    
    var body: some View {
        ZStack {
            if isShowing {
                Rectangle()
                    .opacity(0.3)
                    .ignoresSafeArea()
                    .foregroundColor(.black)
                    .onTapGesture {
                        isShowing.toggle()
                        globalVariables.showHamburger.toggle()
                    }
                
                HStack {
                    VStack(alignment: .leading, spacing: 20) {
                        Image("logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80)
                            .padding(.top, 50)
                        
                        let titleData: [SideMenuOption] = SideMenuDataService.getData()
                        
                        VStack {
                            ForEach(titleData) { option in
                                if option.name.count > 0 {
                                    Button {
                                        selectedTab = option
                                        isShowing = false
                                        globalVariables.showHamburger.toggle()
                                    } label: {
                                        SideMenuRow(option: option)
                                    }
                                } else {
                                    SideMenuRow(option: option)
                                }
                            }
                            
                        }
                        Spacer()
                        
                        SideMenuFooter()
                            .environmentObject(loginManager)
                    }
                    .padding(.leading, 16)
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

