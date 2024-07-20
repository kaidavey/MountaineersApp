//
//  SubHomeActivityTile.swift
//  The Mountaineers
//

import SwiftUI

struct ActivityTileView: View, Identifiable {
    var id: UUID = UUID()
    let text: String
    let imageName: String
    let viewOption: Int
    
    var body: some View {
        NavigationStack {
            NavigationLink {
                DetailView(title: text)
            } label: {
                ZStack {
                    Image(imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 150, height: 150)
                        .clipShape(Rectangle())
                    
                    VStack {
                        Spacer()
                        Rectangle()
                            .frame(width: 150, height: text.count >= 24 ? 40 : 30)
                            .foregroundStyle(.darkGreen)
                            .opacity(0.8)
                            .overlay(
                                HStack {
                                    Text(text)
                                        .foregroundStyle(.white)
                                        .padding(.leading, 8)
                                        .font(.custom("Tahoma-Bold", size: 12))
                                    
                                    Spacer()
                                }
                            )
                    }
                }
                .frame(width: 150, height: 150)
                .clipShape(RoundedRectangle(cornerRadius: 5))
            }
        }
    }
}

#Preview {
    ActivityTileView(text: "Alpine Scramble", imageName: "get-outside", viewOption: 1)
}
