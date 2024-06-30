//
//  SideMenuView.swift
//  The Mountaineers
//

import SwiftUI

struct SideMenuView: View {
    
    @EnvironmentObject var loginManager: LoginManager
    @Binding var isShowing: Bool
    @State var selectedOption: SideMenuOption
    
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
                        VStack(alignment: .leading, spacing: 32) {
                            SideMenuHeader()
                                .environmentObject(loginManager)
                            
                            VStack {
                                ForEach(SideMenuDataService.getData()) { option in
                                    Button(action: {
                                        selectedOption = option
                                    }, label: {
                                        SideMenuRow(option: option, selectedOption: $selectedOption)
                                    })
                                }
                            }
                            
                            Spacer()
                        }
                        .padding()
                        .frame(width: 270, alignment: .leading)
                        .background(.darkGray)
                        
                        Spacer()
                    }
                }
            }
            .transition(.move(edge: .leading))
            .animation(.easeInOut, value: isShowing)
        }
    }
}

#Preview {
    SideMenuView(isShowing: .constant(true), selectedOption: SideMenuOption(name: "TEST CASE", isFontLarge: true))
}
