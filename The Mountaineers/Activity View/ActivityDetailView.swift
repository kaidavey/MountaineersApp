//
//  ActivityDetail.swift
//  The Mountaineers
//

import SwiftUI

struct ActivityDetailView: View {
    @EnvironmentObject var upcomingManager: UpcomingManager
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) private var context
    
    var activity: ActivityOption
    
    var body: some View {
        VStack {
            Rectangle()
                .ignoresSafeArea()
                .foregroundStyle(.charcoal)
                .frame(height: 40)
                .overlay {
                    Text(activity.name.uppercased())
                        .font(.custom("Tahoma-Bold", size: 18))
                        .foregroundStyle(.lightGreen)
                }
                .overlay(alignment: .leading) {
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "arrow.backward")
                                .imageScale(.large)
                                .fontWeight(.bold)
                                .foregroundStyle(.lightGreen)
                                .padding()
                        }
                    
                }
            
            Image(activity.image)
                .resizable()
                .scaledToFit()
            
            Button {
                do {
                    context.insert(activity)
                    try context.save()
                } catch {
                    print(error.localizedDescription)
                }
                dismiss()
            } label: {
                Text("Join \(activity.name)")
            }
            
            Spacer()
        }
    }
}
