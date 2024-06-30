//
//  SideMenuView.swift
//  The Mountaineers
//

import SwiftUI

struct SideMenuView: View {
    
    @EnvironmentObject var loginManager: LoginManager
    @Binding var isShowing: Bool
    @State var selectedTitle: SideMenuOption
    
    var body: some View {
        ZStack {
            if isShowing {
                Rectangle()
                    .opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                        isShowing.toggle()
                    }
                
                HStack {
                    VStack(alignment: .leading, spacing: 32) {
                        let array: [SideMenuOption] = SideMenuDataService.getData()
                        
                        VStack {
                            ForEach(array) { option in
                                Button(action: {
                                    selectedTitle = option
                                    isShowing = false
                                }, label: {
                                    SideMenuRow(option: option, selectedTitle: $selectedTitle)
                                })
                            }
                        }
                        
                        Spacer()
                        
                        SideMenuHeader()
                            .environmentObject(loginManager)
                    }
                    .padding()
                    .frame(width: 270, alignment: .leading)
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
