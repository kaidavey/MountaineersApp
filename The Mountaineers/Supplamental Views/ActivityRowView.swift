//
//  ActivityRowView.swift
//  The Mountaineers
//

import SwiftUI

struct ActivityRowView: View {
    @EnvironmentObject var cartManager: UpcomingManager
    @State var inUpcoming: Bool
    var activity: ActivityOption
    
    var body: some View {
        HStack {
            Image(activity.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 60, height: 60)
                .clipShape(RoundedRectangle(cornerRadius: 4))
            VStack {
                HStack {
                    Text(activity.name)
                        .font(.custom("Times New Roman", size: 20))
                    ForEach(0..<activity.rating) { _ in
                        Image(systemName: "star.fill")
                            .imageScale(.small)
                            .foregroundStyle(.lightOrange)
                    }
                    Spacer()
                }
                .padding(.bottom, 2)
                
                HStack {
                    Text(activity.description)
                        .font(.custom("Times New Roman", size: 14))
                    if inUpcoming {
                        Button {
                            cartManager.removeFromOrder(item: activity)
                        } label: {
                            Image(systemName: "trash")
                        }
                        .imageScale(.small)
                    } else {
                        Button {
                            cartManager.addActivity(item: activity)
                            inUpcoming.toggle()
                        } label: {
                            Image(systemName: "plus")
                        }
                        .imageScale(.small)
                    }
                }
            }
            .frame(height: 120)
        }
        .padding(.top, 10)
        .padding(.horizontal, 20)
    }
}

#Preview {
    ActivityRowView(inUpcoming: false, activity: ActivityOption(name: "Example", image: "get-outside", description: "Don't you notice how I get quiet when there's no one else aroun. me and you in awkward silence.", rating: 3))
}
