//
//  ActivityListView.swift
//  The Mountaineers
//

import SwiftUI

struct ActivityListView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var service = ActivityService()

    var title: String
    var acts:

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

                if service.isLoading {
                    Spacer()
                    ProgressView("Loading activities…")
                    Spacer()
                } else if let error = service.errorMessage {
                    Spacer()
                    VStack(spacing: 8) {
                        Image(systemName: "exclamationmark.triangle")
                            .font(.largeTitle)
                            .foregroundStyle(.secondary)
                        Text(error)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        Button("Retry") {
                            Task { await service.fetchActivities(for: title) }
                        }
                    }
                    Spacer()
                } else if service.activities.isEmpty {
                    Spacer()
                    Text("No upcoming activities for \(title).")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    Spacer()
                } else {
                    ScrollView {
                        VStack(spacing: 12) {
                            ForEach(service.activities) { activity in
                                ActivityTile(activity: activity)
                            }
                        }
                    }
                }
            }
        }
        .task {
            await service.fetchActivities(for: title)
        }
    }
}
