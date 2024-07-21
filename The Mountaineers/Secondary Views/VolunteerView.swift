//
//  VolunteerView.swift
//  The Mountaineers
//

import SwiftUI

struct VolunteerView: View {
    var body: some View {
        ZStack {
            Color.clear
            
            VStack {
                HStack {
                    Text("VOLUNTEER")
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
    VolunteerView()
}
