//
//  ConservationView.swift
//  The Mountaineers
//

import SwiftUI

struct ConservationView: View {
    var body: some View {
        ZStack {
            Color(.systemGray4)
                .opacity(0.8)
                .ignoresSafeArea()
            VStack {
                Rectangle()
                    .ignoresSafeArea()
                    .frame(height: 90)
                    .foregroundStyle(.darkPurple)
                    .overlay(
                        VStack {
                            Spacer()
                            
                            HStack {
                                Text("YOUR ADVENTURES")
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
    ConservationView()
}
