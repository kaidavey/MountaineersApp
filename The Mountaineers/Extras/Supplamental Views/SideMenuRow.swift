//
//  SideMenuRow.swift
//  The Mountaineers
//
//  Created by Hong Huang on 6/30/24.
//

import SwiftUI

struct SideMenuRow: View {
    
    let option: SideMenuOption
    @Binding var selectedTitle: SideMenuOption
    
    var body: some View {
        if (option.isFontLarge) {
            HStack {
                Text(option.name)
                    .font(.custom("Tahoma-Bold", size: 20))
                    .foregroundStyle(.lightBlue)
                    .underline(isSelected ? true : false, color: .lightBlue)
                
                Spacer()
            }
            .padding(.leading, 10)
            .frame(width: 216, height: 44)
        } else {
            HStack {
                Text(option.name)
                    .font(.custom("Tahoma-Bold", size: 16))
                    .foregroundStyle(.white)
                    .underline(isSelected ? true : false, color: .white)
                
                Spacer()
            }
            .padding(.leading, 20)
            .frame(width: 216, height: 30)
        }
    }
    
    private var isSelected: Bool {
        return selectedTitle.name == option.name
    }
}
