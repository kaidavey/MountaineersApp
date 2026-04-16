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
        ZStack {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 170, height: 170)
                .clipShape(Rectangle())
            
            VStack {
                Spacer()
                Rectangle()
                    .frame(width: 170, height: text.count >= 24 ? 45 : 35)
                    .foregroundStyle(.darkGreen)
                    .opacity(0.8)
                    .overlay(
                        HStack {
                            Text(text)
                                .foregroundStyle(.white)
                                .padding(.leading, 8)
                                .font(.custom("Tahoma-Bold", size: 14))
                            
                            Spacer()
                        }
                    )
            }
        }
        .frame(width: 170, height: 170)
        .clipShape(RoundedRectangle(cornerRadius: 5))
    }
}

#Preview {
    ActivityTileView(text: "Alpine Scramble", imageName: "get-outside", viewOption: 1)
}
