//
//  ActivityContainerView.swift
//  The Mountaineers
//

import SwiftUI
import SwiftData

struct ActivityContainerView: View {
    @Binding var date: Date
    @Query private var activities: [ActivityOption]
    
    init(date: Binding<Date>) {
        self._date = date
        
        let calendar = Calendar.current
        let startDate = calendar.startOfDay(for: date.wrappedValue)
        let endOfDate = calendar.date(byAdding: .day, value: 1, to: startDate)!
        let predicate = #Predicate<ActivityOption> {
            return $0.date >= startDate && $0.date < endOfDate
        }
        
        let sortDescriptor = [
            SortDescriptor(\ActivityOption.date, order: .reverse)
        ]
        self._activities = Query(filter: predicate, sort: sortDescriptor, animation: .snappy)
    }
    
    var body: some View {
        ScrollView {
            VStack {
                if activities.isEmpty {
                    Text("No events today.")
                        .padding(.top, 50)
                }
                
                ForEach(activities) { act in
                    ActivityRowView(inUpcoming: true, activity: act)
                }
            }
        }
    }
}
