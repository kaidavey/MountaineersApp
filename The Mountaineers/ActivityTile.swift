//
//  ActivityTile.swift
//  The Mountaineers
//

import SwiftUI

struct ActivityTile: View {
    let activity: Activity

    var body: some View {
        HStack {
            AsyncImage(url: URL(string: activity.imageURL)) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                case .failure:
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(.secondary)
                        .padding(20)
                case .empty:
                    ProgressView()
                @unknown default:
                    EmptyView()
                }
            }
            .frame(width: 90, height: 120)
            .cornerRadius(8)
            .padding(.leading, 12)

            Spacer()

            VStack {
                VStack {
                    HStack {
                        Text(activity.name)
                            .fontWeight(.medium)
                            .font(.title3)
                            .padding(.bottom, 0.4)
                            .padding(.top, 1.4)
                        Spacer()
                    }
                    HStack {
                        Image(systemName: "pin")
                            .rotationEffect(Angle(degrees: -45))
                            .frame(width: 6)
                            .font(.caption)
                            .padding(.leading, 3)
                        Text(activity.location)
                            .font(.subheadline)
                        Spacer()
                    }
                    .opacity(0.6)
                    .padding(.bottom, 0.2)
                    HStack {
                        Image(systemName: "person")
                            .frame(width: 6)
                            .font(.caption)
                            .padding(.leading, 3)
                        Text(activity.leadersDisplay)
                            .font(.subheadline)
                        Spacer()
                    }
                    .opacity(0.6)
                }
                Spacer()
                HStack {
                    Text("\(activity.spotsAvailable) spots")
                        .font(.subheadline)
                        .opacity(0.4)
                    Spacer()
                    HStack {
                        RoundedRectangle(cornerRadius: 999)
                            .frame(width: 90, height: 28)
                            .foregroundStyle(Color(hex: 0xfdfdfd))
                            .overlay(
                                RoundedRectangle(cornerRadius: 999)
                                    .stroke(Color.white, lineWidth: 1)
                            )
                            .overlay {
                                HStack {
                                    Image(systemName: activity.categoryIcon)
                                        .foregroundStyle(.lightBlue)
                                        .font(.footnote)
                                    Text(activity.category)
                                        .foregroundStyle(.lightBlue)
                                        .font(.subheadline)
                                        .fontWeight(.medium)
                                }
                            }
                        Link(destination: URL(string: activity.activityURL) ?? URL(string: "https://mountaineers.org")!) {
                            Circle()
                                .frame(width: 28)
                                .foregroundStyle(Color(hex: 0xfdfdfd))
                                .overlay(
                                    Circle()
                                        .stroke(Color.white, lineWidth: 1)
                                )
                                .overlay {
                                    Image(systemName: "link")
                                        .foregroundStyle(.black)
                                        .font(.footnote)
                                        .fontWeight(.medium)
                                }
                        }
                        Image(systemName: "ellipsis")
                    }
                }
            }
            .padding(.vertical, 12)
            .padding(.trailing, 12)
            .padding(.leading, 8)
        }
        .background(Color(hex: 0xf4f4f4))
        .cornerRadius(16)
        .padding(.horizontal, 14)
        .frame(height: 146)
    }
}

#Preview {
    ActivityTile(activity: Activity(
        id: "preview",
        name: "Winter Backcountry Ski",
        location: "Mt. Rainier National Park, WA",
        leaders: ["Matt D.", "Veronica H."],
        spotsAvailable: 4,
        category: "Skiing",
        categoryIcon: "skis.fill",
        imageURL: "https://www.mountaineers.org/images/sample.jpg",
        activityURL: "https://www.mountaineers.org",
        date: Date(),
        blurb: "A beautiful winter ski tour."
    ))
}

extension Color {
    init(hex: Int, opacity: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: opacity
        )
    }
}
