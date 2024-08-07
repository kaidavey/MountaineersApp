//
//  CartView.swift
//  The Mountaineers
//

import SwiftUI

struct UpcomingView: View {
    @EnvironmentObject var upcomingManager: UpcomingManager
    @Binding var isShowing: Bool
    
    @State var currentDate: Date = Date()
    
    @State var weekSlider: [[Date.WeekDay]] = []
    @State var currentWeekIndex: Int = 1
    
    @Namespace private var animation
    
    @State private var createWeek: Bool = false
    
    var body: some View {
        if isShowing {
            ZStack {
                Color
                    .tan
                    .ignoresSafeArea()
                VStack {
                    TabView(selection: $currentWeekIndex) {
                        ForEach(weekSlider.indices, id: \.self) { index in
                            let week = weekSlider[index]
                            
                            weekView(week)
                                .tag(index)
                        }
                    }
                    .tabViewStyle(.page(indexDisplayMode: .never))
                    .frame(height: 150)
                    .padding(.vertical)
                    .onChange(of: currentWeekIndex, initial: false) { oldValue, newValue in
                        if newValue == 0 || newValue == (weekSlider.count - 1) {
                            createWeek = true
                        }
                    }
                    .onAppear {
                        if weekSlider.isEmpty {
                            let currentWeek = Date().fetchWeek()
                            
                            if let firstDate = currentWeek.first?.date {
                                weekSlider.append(firstDate.createPreviousWeek())
                            }
                            
                            weekSlider.append(currentWeek)
                            
                            if let lastDate = currentWeek.last?.date {
                                weekSlider.append(lastDate.createNextWeek())
                            }
                        }
                    }
                    .background {
                        Rectangle()
                            .foregroundStyle(.dynamicGray)
                            .frame(height: 170)
                    }
                    
                    
                    ActivityContainerView(date: $currentDate)
                    
                    Spacer()
                }
            }
        }
    }
    
    @ViewBuilder
    func weekView(_ week: [Date.WeekDay]) -> some View {
        VStack {
            HStack(spacing: 10) {
                Button {
                    
                } label: {
                    Image(systemName: "chevron.backward")
                        .foregroundStyle(.dynamicBlack)
                        .imageScale(.small)
                }
                
                Text("Week of " + week[0].date.format("MMMM") + " " + week[0].date.format("d") + ", " + week[0].date.format("U"))
                    .font(.custom("Tahoma", size: 16))
                    .padding(15)
                    .foregroundStyle(.dynamicBlack)
                
                Button {
                    
                } label: {
                    Image(systemName: "chevron.forward")
                        .foregroundStyle(.dynamicBlack)
                        .imageScale(.small)
                }
            }
            
            HStack(spacing: 0) {
                ForEach(week) { day in
                    VStack {
                        Text(day.date.format("E"))
                            .font(.custom("Tahoma", size: 12))
                            .opacity(0.5)
                        
                        Text(day.date.format("dd"))
                            .font(.custom("Tahoma-Bold", size: 16))
                            .frame(width: 50, height: 40)
                            .foregroundStyle(isSameDate(day.date, currentDate) ? .white : .black)
                            .background(content: {
                                if isSameDate(day.date, currentDate) {
                                    Circle()
                                        .fill(day.date.isToday ? .darkBlue : .lightBlue)
                                }
                            })
                    }
                    .onTapGesture {
                        currentDate = day.date
                    }
                }
            }
            .background {
                GeometryReader {
                    let minX = $0.frame(in: .global).minX
                    
                    Color
                        .clear
                        .preference(key: OffsetKey.self, value: minX)
                        .onPreferenceChange(OffsetKey.self, perform: { value in
                            if value.rounded() == 15 && createWeek {
                                paginateWeek()
                                createWeek = false
                            }
                        })
                }
            }
        }
        .padding(.top, 25)
    }
    
    func paginateWeek() {
        if weekSlider.indices.contains(currentWeekIndex) {
            if let firstDate = weekSlider[currentWeekIndex].first?.date, currentWeekIndex == 0 {
                weekSlider.insert(firstDate.createPreviousWeek(), at: 0)
                weekSlider.removeLast()
                currentWeekIndex = 1
            }
            
            if let lastDate = weekSlider[currentWeekIndex].last?.date, currentWeekIndex == (weekSlider.count - 1) {
                weekSlider.append(lastDate.createNextWeek())
                weekSlider.removeFirst()
                currentWeekIndex = weekSlider.count - 2
            }
        }
    }
}
