//
//  Detail.swift
//  The Mountaineers
//

import SwiftUI

struct DetailView: View {
    @EnvironmentObject var upcomingManager: UpcomingManager
    @Environment(\.dismiss) var dismiss
    var title: String
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color
                    .tan
                    .ignoresSafeArea()
                VStack {
                    ActivityRowView(inUpcoming: false, activity: ActivityOption(name: "Example", image: "get-outside", description: "Don't you notice how I get quiet when there's no one else aroun. me and you in awkward silence.", rating: 3))
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
    DetailView(title: "Example")
}
