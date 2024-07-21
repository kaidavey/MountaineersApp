//
//  SideMenuView.swift
//  The Mountaineers
//

import SwiftUI

struct SideMenuView: View {
    @EnvironmentObject var loginManager: LoginManager
    @Binding var isShowing: Bool
    @Binding var selectedTab: SideMenuOption
    
    var body: some View {
        ZStack {
            if isShowing {
                Rectangle()
                    .opacity(0.3)
                    .ignoresSafeArea()
                    .foregroundColor(.black)
                    .onTapGesture {
                        isShowing.toggle()
                    }
                
                HStack {
                    VStack(alignment: .leading, spacing: 20) {
                        Image("logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 85)
                            .padding(.top, 50)
                        
                        let titleData: [SideMenuOption] = SideMenuDataService.getData()
                        
                        VStack {
                            ForEach(titleData) { option in
                                if option.name.count > 0 {
                                    Button {
                                        selectedTab = option
                                        isShowing.toggle()
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
                        
                        Button {
                            loginManager.logOut()
                        } label: {
                            Text("Log Out")
                                .font(.custom("Tahoma-Bold", size: 16))
                                .foregroundStyle(.red)
                                .padding([.leading, .bottom], 10)
                        }
                        .padding(.bottom, 10)
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

