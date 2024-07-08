//
//  ExploreView.swift
//  The Mountaineers
//

import SwiftUI

struct ExploreView: View {
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    let arr: [ActivityTileView] = ActivityTileDataService.getData()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemGray4)
                    .ignoresSafeArea()
                    .opacity(0.8)
                VStack {
                    Rectangle()
                        .ignoresSafeArea()
                        .frame(height: 90)
                        .foregroundStyle(.darkGreen)
                        .overlay(
                            VStack {
                                Spacer()
                                
                                HStack {
                                    Text("GET OUTSIDE WITH US")
                                        .font(.custom("Tahoma-Bold", size: 26))
                                        .foregroundStyle(.white)
                                        .padding([.leading, .bottom], 15)
                                    
                                    Spacer()
                                }
                            }
                        )
                    Spacer()
                    
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
}

#Preview {
    ExploreView()
}
