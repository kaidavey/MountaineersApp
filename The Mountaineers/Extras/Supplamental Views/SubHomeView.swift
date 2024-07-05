//
//  SubHomeView.swift
//  The Mountaineers
//

import SwiftUI

struct SubHomeView: View {
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    let arr: [ActivityTileView] = ActivityTileDataService.getData()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color
                    .clear
                    .ignoresSafeArea()
                ScrollView {
                    Text(introText)
                        .font(.custom("New Spirit", size: 16))
                        .padding([.trailing, .bottom, .leading], 20)
                        .padding(.top, 10)
                        .foregroundStyle(.dynamicBlack)
                        .lineSpacing(5)
                    
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(arr) { tile in
                            ActivityTileView(text: tile.text, imageName: tile.imageName, viewOption: tile.viewOption)
                        }
                    }
                    .padding()
                }
            }
        }
    }
}

#Preview {
    SubHomeView()
}
