//
//  FilterTile.swift
//  The Mountaineers
//
//  Created by Kai Davey on 4/15/26.
//

import Foundation
import SwiftUI

struct FilterTile: View {
    let hasIcon: Bool
    let icon: String
    let iconColor: Int
    let color: Int
    let border: Int
    let textColor: Int
    let filterText: String
    
    var body: some View {
        HStack(spacing: 8) {
            if (hasIcon) {
                Image(systemName: icon)
                    .foregroundColor(Color(hex: iconColor))
                    .font(.subheadline)
            }
            Text(filterText)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(Color(hex: textColor))
                //.fixedSize()
        }
        .padding(.horizontal, 12)
        .frame(height: 32)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(hex: color))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .strokeBorder(Color(hex: border), lineWidth: 1.5)
        )
    }
}

#Preview {
    FilterTile(hasIcon: true, icon: "person.fill", iconColor: 0xffffff, color: 0x282828, border: 0x000000, textColor: 0xffffff, filterText: "All Saves")
}
