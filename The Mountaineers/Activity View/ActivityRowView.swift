//
//  ActivityRowView.swift
//  The Mountaineers
//

import SwiftUI

struct ActivityRowView: View {
    @EnvironmentObject var upcomingManager: UpcomingManager
    @State var inUpcoming: Bool
    var activity: ActivityOption
    
    var body: some View {
        HStack {
            Image(activity.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 60, height: 60)
                .clipShape(RoundedRectangle(cornerRadius: 2))
            
            VStack {
                HStack {
                    Text(activity.name)
                        .font(.custom("Interstate", size: 16))
                        .padding(.leading, 10)
                        .padding(.bottom, 2)
                        .foregroundStyle(.dynamicBlack)
                    Spacer()
                    
                    Label("\(activity.date.format("hh:mm a"))", systemImage: "clock")
                        .font(.custom("Interstate", size: 16))
                        .foregroundStyle(.dynamicBlack)
                }
                
                Text(activity.blurb)
                    .font(.custom("Tahoma", size: 12))
                    .padding(.bottom, 4)
                    .foregroundStyle(.dynamicBlack)
                
                /*HStack {
                 if inUpcoming {
                 Rectangle()
                 .frame(width: 145, height: 20)
                 .cornerRadius(5)
                 .foregroundStyle(.red)
                 .overlay {
                 Button {
                 upcomingManager.removeActivity(item: activity)
                 } label: {
                 Text("Remove from Upcoming")
                 .font(.custom("Tahoma", size: 12))
                 .foregroundColor(.white)
                 }
                 .imageScale(.small)
                 }
                 } else {
                 Rectangle()
                 .frame(width: 120, height: 20)
                 .cornerRadius(5)
                 .foregroundStyle(.darkGreen)
                 .overlay {
                 Button {
                 upcomingManager.addActivity(item: activity)
                 } label: {
                 Text("Add to Upcoming")
                 .font(.custom("Tahoma", size: 12))
                 .foregroundStyle(.white)
                 }
                 .imageScale(.small)
                 }
                 }*/
            }
        }
        .frame(height: 120)
        .padding(.top, 10)
        .padding(.horizontal, 20)
    }
}

