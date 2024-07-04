//
//  SubHomeActivityTile.swift
//  The Mountaineers
//
//  Created by Hong Huang on 7/2/24.
//

import SwiftUI

struct ActivityTileView: View, Identifiable {
    var id: UUID = UUID()
    let text: String
    let imageName: String
    let view: AnyView
    
    var body: some View {
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

#Preview {
    ActivityTileView(text: "Alpine Scramble", imageName: "get-outside", view: AnyView(ClimbingView()))
}
