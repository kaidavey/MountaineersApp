//
//  SideMenuHeader.swift
//  The Mountaineers
//

import SwiftUI

struct SideMenuHeader: View {
    
    @EnvironmentObject var loginManager: LoginManager
    
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: "person.crop.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 48, height: 48)
                .foregroundStyle(.gray)
            Text(loginManager.getUsername())
                .font(.custom("Tahoma-Bold", size: 16))
                .foregroundStyle(.white)
        }
    }
}
