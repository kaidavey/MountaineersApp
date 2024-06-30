//
//  SideMenuRow.swift
//  The Mountaineers
//
//  Created by Hong Huang on 6/30/24.
//

import SwiftUI

struct SideMenuRow: View {
    
    let option: SideMenuOption
    
    var body: some View {
        if (option.isFontLarge) {
            HStack {
                Text(option.name)
                    .font(.custom("Tahoma-Bold", size: 20))
                    .foregroundStyle(.lightBlue)
                
                Spacer()
            }
            .padding(.leading, 10)
            .frame(height: 44)
        } else {
            HStack {
                Text(option.name)
                    .font(.custom("Tahoma-Bold", size: 16))
                    .foregroundStyle(.white)
                
                Spacer()
            }
            .padding(.leading, 20)
            .frame(height: 30)
        }
    }
}

#Preview {
    SideMenuRow(option: SideMenuOption(name: "TEST CASE", isFontLarge: true))
}
