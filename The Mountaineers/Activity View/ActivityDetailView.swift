//
//  ActivityDetail.swift
//  The Mountaineers
//

import SwiftUI

struct ActivityDetailView: View {
    @EnvironmentObject var upcomingManager: UpcomingManager
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) private var context

    var activity: Activity

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

            AsyncImage(url: URL(string: activity.imageURL)) { phase in
                switch phase {
                case .success(let image):
                    image.resizable().scaledToFit()
                case .failure, .empty:
                    Rectangle()
                        .foregroundStyle(.secondary.opacity(0.2))
                        .frame(height: 200)
                @unknown default:
                    EmptyView()
                }
            }

            Button {
                let saved = ActivityOption(from: activity)
                context.insert(saved)
                try? context.save()
                dismiss()
            } label: {
                Text("Join \(activity.name)")
            }

            Spacer()
        }
    }
}
