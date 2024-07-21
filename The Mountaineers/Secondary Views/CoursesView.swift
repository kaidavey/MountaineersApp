//
//  CoursesView.swift
//  The Mountaineers
//

import SwiftUI

struct CoursesView: View {
    var body: some View {
        ZStack {
            Color.clear
            
            VStack {
                HStack {
                    Text("COURSES")
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
    CoursesView()
}
