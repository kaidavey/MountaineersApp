//
//  HomeView.swift
//  The Mountaineers
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            Color
                .tan
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    Text("YOUR ADVENTURES")
                        .font(.custom("Tahoma-Bold", size: 26))
                        .foregroundStyle(.dynamicBlack)
                        .padding(20)
                    Spacer()
                }
                Spacer()
            }
        }
    }
}

#Preview {
    HomeView()
}
