//
//  Detail.swift
//  The Mountaineers
//

import SwiftUI

struct DetailView: View {
    @EnvironmentObject var upcomingManager: UpcomingManager
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color
                    .tan
                    .ignoresSafeArea()
                VStack {
                    ActivityRowView(inUpcoming: false, activity: ActivityOption(name: "Ancient Lakes Backpack", image: "ancient-lakes", description: "A scenic backpack through the gullies and ridges of Ancient Lakes Basin."))
                    Spacer()
                }
            }
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        HStack {
                            Image(systemName: "arrow.left")
                                .fontWeight(.semibold)
                            Text("Back")
                                .font(.custom("Tahoma", size: 18))
                        }
                        .foregroundStyle(.darkGreen)
                    }
                }
            }
        }
    }
}

#Preview {
    DetailView()
}
