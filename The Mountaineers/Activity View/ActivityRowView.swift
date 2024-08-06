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
                        .font(.custom("Tahoma", size: 16))
                        .padding(.leading, 10)
                        .padding(.bottom, 2)
                    Spacer()
                }
                
                Text(activity.description)
                    .font(.custom("Times New Roman", size: 14))
                    .padding(.bottom, 4)
                
                HStack {
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
                    }
                }
            }
        }
        .frame(height: 120)
        .padding(.top, 10)
        .padding(.horizontal, 20)
    }
}

#Preview {
    ActivityRowView(inUpcoming: false, activity: ActivityOption(name: "Ancient Lakes Backpack", image: "ancient-lakes", description: "A scenic backpack through the gullies and ridges of Ancient Lakes Basin."), date: Date)
}
