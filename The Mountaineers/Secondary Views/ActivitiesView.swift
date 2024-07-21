//
//  ActivitiesView.swift
//  The Mountaineers
//

import SwiftUI

struct ActivitiesView: View {
    var body: some View {
        ZStack {
            Color.clear
            
            VStack {
                HStack {
                    Text("ACTIVITIES")
                        .font(.custom("Tahoma-Bold", size: 26))
                        .foregroundStyle(.black)
                        .padding(20)
                    Spacer()
                }
                Spacer()
            }
        }
    }
}

#Preview {
    ActivitiesView()
}
