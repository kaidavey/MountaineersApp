//
//  SideMenuRow.swift
//  The Mountaineers
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
            .frame(width: 216, height: 34)
        } else if option.name.count == 0 {
            HStack {
                Rectangle()
                    .opacity(0.1)
                    .frame(width: 180, height: 1.5)
                    .cornerRadius(5.0)
                    .foregroundStyle(.black)
                
                Spacer()
            }
            .frame(width: 180, height: 1.5)
        } else {
            HStack {
                Text(option.name)
                    .font(.custom("Tahoma-Bold", size: 16))
                    .foregroundStyle(.white)
               
                Spacer()
            }
            .padding(.leading, 20)
            .frame(width: 216, height: 20)
        }
    }
}
