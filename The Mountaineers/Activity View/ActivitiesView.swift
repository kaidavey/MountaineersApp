//
//  ActivitiesView.swift
//  The Mountaineers
//

import SwiftUI

struct ActivitiesView: View {
    @EnvironmentObject var upcomingManager: UpcomingManager
    @State private var presentNewAct: Bool = false
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    let arr: [ActivityTileView] = ActivityTileDataService.getData()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                Image("get-outside")
                    .resizable()
                    .scaledToFit()
                    .ignoresSafeArea()
                    .overlay {
                        HStack {
                            VStack {
                                Spacer()
                                Text("GET OUTSIDE WITH US")
                                    .font(.custom("Tahoma-Bold", size: 25))
                                    .foregroundStyle(.white)
                                    .padding(20)
                                    .shadow(color: Color.black, radius: 5, x: 2, y: 4)
                            }
                            Spacer()
                        }
                    }
                
                Text(activitiesBlurb)
                    .font(.custom("New Spirit", size: 14))
                    .padding([.trailing, .bottom, .leading], 20)
                    .padding(.top, 10)
                    .foregroundStyle(.dynamicBlack)
                    .lineSpacing(5)
                
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(arr) { tile in
                        Button {
                            presentNewAct.toggle()
                        } label: {
                            ActivityTileView(text: tile.text, imageName: tile.imageName, viewOption: tile.viewOption)
                                .padding(10)
                        }
                        .fullScreenCover(isPresented: $presentNewAct) {
                            withAnimation(.easeIn(duration: 1.5)) {
                                ActivityListView(title: tile.text, acts: [ActivityOption(name: "Ancient Lakes", image: "ancient-lakes", blurb: "Come backpacking with us through the Colombia gorge as we smell wildflowers and chase waterfalls. Instructor: John Doe."), ActivityOption(name: "Snow Lake", image: "get-outside", blurb: "There may not be snow, but you're bound to enjoy this backpack. Please bring your own lunch. We meet at the Greenlake parking lot.")])
                            }
                        }
                        
                    }
                    //.padding()
                }
                //.background(.tan)
            }
        }
    }
}

