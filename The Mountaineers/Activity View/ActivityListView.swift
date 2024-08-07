//
//  ActivityListView.swift
//  The Mountaineers
//

import SwiftUI

struct ActivityListView: View {
    @Environment(\.dismiss) var dismiss
    
    var title: String
    var acts: [ActivityOption]
    
    var body: some View {
        NavigationStack {
            VStack {
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
                
                ForEach(acts) { act in
                    NavigationLink {
                        ActivityDetailView(activity: act)
                            .navigationBarBackButtonHidden(true)
                    } label: {
                        ActivityRowView(inUpcoming: false, activity: act)
                    }
                    
                }
                Spacer()
            }
        }
    }
}
