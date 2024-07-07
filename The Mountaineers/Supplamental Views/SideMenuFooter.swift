//
//  SideMenuHeader.swift
//  The Mountaineers
//

import SwiftUI

struct SideMenuFooter: View {
    @EnvironmentObject var loginManager: LoginManager
    
    var body: some View {
        HStack(spacing: 15) {
            Image(systemName: "person.crop.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 38, height: 38)
                .foregroundStyle(.gray)
            Text(loginManager.getUsername())
                .font(.custom("Tahoma-Bold", size: 16))
                .foregroundStyle(.white)
        }
    }
}
