//
//  AboutView.swift
//  The Mountaineers
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        ZStack {
            Color(.systemGray4)
                .opacity(0.8)
                .ignoresSafeArea()
            VStack {
                Rectangle()
                    .ignoresSafeArea()
                    .frame(height: 90)
                    .foregroundStyle(.lightOrange)
                    .overlay(
                        VStack {
                            Spacer()
                            
                            HStack {
                                Text("ABOUT")
                                    .font(.custom("Tahoma-Bold", size: 26))
                                    .foregroundStyle(.white)
                                    .padding([.leading, .bottom], 15)
                                
                                Spacer()
                            }
                        }
                )
                Spacer()
            }
        }
    }
}

#Preview {
    AboutView()
}
