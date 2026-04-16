//
//  AboutView.swift
//  The Mountaineers
//

import SwiftUI

struct ActivityTile: View {
    var body: some View {
        HStack {
            Image(.backcountrySkiing)
                .resizable()
                .scaledToFill()
                .frame(width: 90, height: 120)
                .cornerRadius(8)
                .padding(.leading, 12)
            Spacer()
            VStack {
                VStack {
                    HStack {
                        Text("Winter Backcountry Ski")
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
                        Text("Mt. Rainer National Park, WA")
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
                        Text("Matt D., Veronica H.")
                            .font(.subheadline)
                        Spacer()
                    }
                    .opacity(0.6)
                }
                Spacer()
                HStack {
                    Text("4 spots")
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
                                    Image(systemName: "skis.fill")
                                        .foregroundStyle(.lightBlue)
                                        .font(.footnote)
                                    Text("Skiing")
                                        .foregroundStyle(.lightBlue)
                                        .font(.subheadline)
                                        .fontWeight(.medium)
                                }
                            }
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
    ActivityTile()
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
