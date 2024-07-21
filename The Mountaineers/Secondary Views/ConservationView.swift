//
//  ConservationView.swift
//  The Mountaineers
//

import SwiftUI

struct ConservationView: View {
    var body: some View {
        ZStack {
            Color.clear
            
            VStack {
                HStack {
                    Text("CONSERVE")
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
    ConservationView()
}
