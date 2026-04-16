//
//  ActivityListView.swift
//  The Mountaineers
//

import SwiftUI

struct ActivityListView: View {
    @Environment(\.dismiss) var dismiss
    
    var title: String
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Rectangle()
                    .ignoresSafeArea()
                    .foregroundStyle(.charcoal)
                    .frame(height: 40)
                    .overlay {
                        Text(title.uppercased())
                            .font(.custom("Tahoma-Bold", size: 18))
                            .foregroundStyle(.lightGreen)
                    }
                    .overlay(alignment: .leading) {
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "chevron.down")
                                .imageScale(.large)
                                .fontWeight(.bold)
                                .foregroundStyle(.lightGreen)
                                .padding()
                        }
                    
                    }
                ScrollView {
                    VStack(spacing: 12) {
                        ForEach(0..<10) { _ in
                            ActivityTile()
                        }
                    }
                }
            }
        }
    }
}
