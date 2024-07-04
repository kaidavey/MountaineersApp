//
//  SubHomeView.swift
//  The Mountaineers
//
//  Created by Hong Huang on 7/2/24.
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
                    Text("Our goal is to get you outside exploring new places and finding new challenges. Trips like hiking and backpacking and naturalist activities which are less technical are open to everyone. Trips that are more technical like climbing, backcountry skiing, and sea kayaking often have skill prerequisites to ensure that everyone is safe and has the skills needed to successfully participate in the activity.")
                        .font(.custom("New Spirit", size: 16))
                        .padding([.trailing, .bottom, .leading], 20)
                        .padding(.top, 10)
                        .foregroundStyle(.black)
                        .lineSpacing(5)
                    
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(arr) { tile in
                            NavigationLink(destination: tile.view) {
                                ActivityTileView(text: tile.text, imageName: tile.imageName, view: AnyView(tile.view))
                            }
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
