//
//  CartView.swift
//  The Mountaineers
//

import SwiftUI

struct CartView: View {
    @Binding var isShowing: Bool
    
    var body: some View {
        if isShowing {
            ZStack {
                Color
                    .tan
                    .ignoresSafeArea()
                
                VStack {
                    HStack {
                        Text("CART")
                            .font(.custom("Tahoma-Bold", size: 25))
                            .foregroundStyle(.dynamicBlack)
                            .padding(20)
                        Spacer()
                    }
                    Spacer()
                }
            }
        }
    }
}
