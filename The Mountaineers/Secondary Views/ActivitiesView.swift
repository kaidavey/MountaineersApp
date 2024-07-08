//
//  ActivitiesView.swift
//  The Mountaineers
//

import SwiftUI

struct ActivitiesView: View {
    var body: some View {
        ZStack {
            Color(.systemGray4)
                .opacity(0.8)
                .ignoresSafeArea()
            VStack {
                Rectangle()
                    .ignoresSafeArea()
                    .frame(height: 90)
                    .foregroundStyle(.darkGreen)
                    .overlay(
                        VStack {
                            Spacer()
                            
                            HStack {
                                Text("ACTIVITIES")
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
    ActivitiesView()
}
