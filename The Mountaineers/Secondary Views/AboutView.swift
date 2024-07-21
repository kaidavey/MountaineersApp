//
//  AboutView.swift
//  The Mountaineers
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        ZStack {
            Color.clear
            
            VStack {
                HStack {
                    Text("ABOUT")
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
    AboutView()
}
