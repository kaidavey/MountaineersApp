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
        VStack {
            HStack {
                AsyncImage(url: URL(string: activity.imageURL)) { phase in
                    switch phase {
                    case .success(let image):
                        image.resizable().aspectRatio(contentMode: .fill)
                    default:
                        Rectangle().foregroundStyle(.secondary.opacity(0.2))
                    }
                }
                .frame(width: 100, height: 100)
                .clipShape(RoundedRectangle(cornerRadius: 2))
                
                VStack {
                    VStack {
                        HStack {
                            Text(activity.name)
                                .font(.custom("Interstate", size: 20))
                                .padding(.bottom, 5)
                                .foregroundStyle(.dynamicBlack)
                            Spacer()
                        }
                        HStack {
                            Text(activity.date.format("MMM d, yyyy"))
                                .font(.custom("Interstate", size: 16))
                                .foregroundStyle(.blue)
                            Spacer()
                        }
                        HStack {
                            Text(activity.date.format("h:mm a"))
                                .font(.custom("Interstate", size: 16))
                                .foregroundStyle(.blue)
                            Spacer()
                        }
                        Spacer()
                    }
                    .padding(.leading, 10)
                    
                    HStack {
                        
                    }
                    Spacer()
                }
                
                Spacer()
            }
            
            HStack {
                Text(activity.blurb)
                    .font(.custom("Tahoma", size: 12))
                    .padding(.bottom, 4)
                    .foregroundStyle(.dynamicBlack)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Spacer()
            }
        }
        .frame(height: 120)
        .padding(.top, 10)
        .padding(.horizontal, 20)
        .padding(.bottom, 20)
    }
}

