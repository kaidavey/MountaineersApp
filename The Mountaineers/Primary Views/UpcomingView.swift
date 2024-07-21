//
//  CartView.swift
//  The Mountaineers
//

import SwiftUI

struct UpcomingView: View {
    @EnvironmentObject var upcomingManager: UpcomingManager
    @Binding var isShowing: Bool
    
    var body: some View {
        if isShowing {
            ZStack {
                Color
                    .tan
                    .ignoresSafeArea()
                
                ScrollView {
                    ForEach(upcomingManager.getActivities()) { activity in
                        ActivityRowView(inUpcoming: true, activity: activity)
                            .environmentObject(upcomingManager)
                        
                        Rectangle()
                            .foregroundStyle(.black.opacity(0.2))
                            .frame(height: 1)
                            .cornerRadius(5.0)
                            .padding(.horizontal, 20)
                    }
                }
            }
        }
    }
}
