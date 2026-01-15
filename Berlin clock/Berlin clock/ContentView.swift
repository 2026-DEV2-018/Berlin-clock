//
//  ContentView.swift
//  Berlin clock
//
//  Created by 2026-DEV2-018 on 13/01/2026.
//

import SwiftUI
import Combine

//enum Lamp {
//    case off
//    case yellow
//    case red
//}

//struct ContentView2: View {
//    var body: some View {
//        
//    }
//    
//    func fiveHoursRowOutput(hours: Int) -> [Lamp] {
//        let result = hours / 5
//        let numberOfFiveHourLamps = 4
//    }
//}
//
//#Preview {
//    ContentView()
//}

struct ContentView: View {
    
    var dateComponents: DateComponents {
        var components = DateComponents()
        components.hour = 18
        components.minute = 35
        return components
    }
    
    @State private var currentTime = Date()
    
    let calendar = Calendar.current
    
    lazy var setDate = Calendar.current.date(from: dateComponents)
        
        
        
        var hours: Int {
            Calendar.current.component(.hour, from: currentTime)
            
//            calendar.component(.hour, from: setDate ?? Date.now)
        }
        
    var minutes: Int {
            Calendar.current.component(.minute, from: currentTime)
            
//            calendar.component(.minute, from: setDate ?? Date.now)
        }
        
    var seconds: Int {
            Calendar.current.component(.second, from: currentTime)
            
//            calendar.component(.second, from: setDate ?? Date.now)
        }
            
        let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
            
            
        private var timeFormatter: DateFormatter {
            let formatter = DateFormatter()
            formatter.dateFormat = "HH:mm:ss"
    //        formatter.timeStyle = .medium // uur:minuut:seconde
            return formatter
        }
        
        var secondsColor: Color {
            seconds % 2 == 0 ? .yellow : .clear
        }
        
        var secondsView: some View {
            Circle().fill(secondsColor).stroke(.black, lineWidth: 2).frame(width: 50, height: 50)
        }
        
        let numberOfHourElements = 4
        let numberOfFiveMinuteElements = 11
        let numberOfOneMinuteElements = 4
        
        var numberOfFiveHourElementsActive: Int {
            hours / 5
        }
        
        var numberOfOneHourElementsActive: Int {
            hours % 5
        }
        
        var numberOfFiveMinuteElementsActive: Int {
            minutes / 5
        }
        
        var numberOfOneMinuteElementsActive: Int {
            minutes % 5
        }
        
        func colorFiveMinuteElements(index: Int, isActive: Bool) -> Color {
            if (index) % 3 == 0 && isActive { // && index < numberOfFiveHourElementsActive
                return .red
            }
            
            if (index) % 3 == 0 && !isActive {
                return .clear
            }
            
    //        if (index <= numberOfFiveHourElementsActive) {
    //            return .yellow
    //        }
            
            if isActive {
                return .yellow
            }
            
            return .clear
        }
        
        var fiveHoursRowView: some View {
            HStack(spacing: 8) {
                ForEach((1...numberOfHourElements), id: \.self) { index in
                    Rectangle()
                        .fill(index <= numberOfFiveHourElementsActive ? .red : .clear)
                        .stroke(.black)
                        .frame(width: 60, height: 30)
                }
            }
        }
        
        var oneHoursRowView: some View {
            HStack(spacing: 8) {
                ForEach((1...numberOfHourElements), id: \.self) { index in
                    Rectangle()
                        .fill(index <= numberOfOneHourElementsActive ? .red : .clear)
                        .stroke(.black)
                        .frame(width: 60, height: 30)
                }
            }
        }
        
        var fiveMinutesRowView: some View {
            HStack(spacing: 4) {
                ForEach((1...numberOfFiveMinuteElements), id: \.self) {index in
                    Rectangle()
    //                    .fill(index < numberOfFiveMinuteElementsActive ? .red : .black)
                        .fill(colorFiveMinuteElements(index: index, isActive: index <= numberOfFiveMinuteElementsActive))
                        .stroke(.black)
                        .frame(width: 20, height: 30)
                        
                }
            }
        }
        
        var oneMinuteRowView: some View {
            HStack(spacing: 8) {
                ForEach((1...numberOfOneMinuteElements), id: \.self) { index in
                    Rectangle()
                        .fill(index < numberOfFiveMinuteElementsActive ? .red : .clear)
                        .stroke(.black)
                        .frame(width: 60, height: 30)
                }
            }
        }
    
    var body: some View {
        
        VStack{
            secondsView
            
            fiveHoursRowView
            
            oneHoursRowView
            
            fiveMinutesRowView
            
            oneMinuteRowView
            
            Text(timeFormatter.string(from: currentTime))
                        .font(.largeTitle)
//                        .onReceive(timer) { input in
//                            currentTime = input // update elke seconde
//                        }
                        .padding()
                
        }
        .onReceive(timer) { input in
            currentTime = input
        }
        
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//            Text("Hello, world!")
//        }
//        .padding()
    }
}

#Preview {
    ContentView()
}


//struct BerlinClock {
//    
//    function fiveHourRow
//}
