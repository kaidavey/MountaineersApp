//
//  SideMenuHeader.swift
//  The Mountaineers
//

import SwiftUI

struct SideMenuFooter: View {
    @EnvironmentObject var loginManager: LoginManager
    
    var body: some View {
        var username: String = loginManager.getUsername()
        
        HStack(spacing: 15) {
            Image(systemName: "person.crop.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 38, height: 38)
                .foregroundStyle(.gray)
            
            if username.count > 16 {
                Text(username.prefix(16) + "...")
                    .font(.custom("Tahoma-Bold", size: 16))
                    .foregroundStyle(.white)
            } else {
                Text(username)
                    .font(.custom("Tahoma-Bold", size: 16))
                    .foregroundStyle(.white)
            }
            
            
        }
        .padding(.leading, 5)
    }
}
