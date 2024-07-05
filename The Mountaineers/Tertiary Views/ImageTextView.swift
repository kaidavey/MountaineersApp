//
//  ImageTextView.swift
//  The Mountaineers
//
//  Created by Hong Huang on 7/5/24.
//

import SwiftUI

struct ImageTextView: View {
    
    @Environment(\.dismiss) var dismiss
    var title: String
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemGray4)
                    .ignoresSafeArea()
                    .opacity(0.8)
                VStack {
                    Rectangle()
                        .ignoresSafeArea()
                        .frame(height: 50)
                        .foregroundStyle(.darkGreen)
                        .overlay(
                            HStack {
                                Text(title)
                                    .font(.custom("Tahoma-Bold", size: 26))
                                    .foregroundStyle(.white)
                                    .padding([.leading, .bottom], 15)
                                
                                Spacer()
                            }
                        )
                    Spacer()
                }
            }
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        HStack {
                            Image(systemName: "arrow.left")
                                .fontWeight(.semibold)
                            //Text("Back")
                            //    .font(.custom("Tahoma", size: 18))
                        }
                        .foregroundStyle(.white)
                    }
                }
            }
        }
    }
}

#Preview {
    ImageTextView(title: "Example")
}
