//
//  ContentView.swift
//  Berlin clock
//
//  Created by 2026-DEV2-018 on 13/01/2026.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @State private var viewModel = BerlinClockViewModel(clock: BerlinClock())
    var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        VStack(spacing: 12) {
            Circle()
                .stroke(.black, lineWidth: 2)
                .frame(width: 50, height: 50)
            
            HStack(spacing: 8) {
                ForEach(0 ..< viewModel.fiveHourLamps.count, id: \.self) { fiveHourBlock in
                    Rectangle()
                        .stroke(.black, lineWidth: 2)
                        .frame(width: 50, height: 20)
                }
            }
            
            HStack(spacing: 8) {
                ForEach(0 ..< viewModel.oneHourLamps.count, id: \.self) { oneHourBlock in
                    Rectangle()
                        .stroke(.black, lineWidth: 2)
                        .frame(width: 50, height: 20)
                }
            }
            
            HStack(spacing: 8) {
                ForEach(0 ..< viewModel.fiveMinuteLamps.count, id: \.self) { fiveMinuteBlock in
                    Rectangle()
                        .stroke(.black, lineWidth: 2)
                        .frame(width: 20, height: 50)
                }
            }
            
            HStack(spacing: 8) {
                ForEach(0 ..< viewModel.oneMinuteLamps.count, id: \.self) { oneMinuteBlock in
                    Rectangle()
                        .stroke(.black, lineWidth: 2)
                        .frame(width: 50, height: 20)
                }
            }
        }
        .padding()
        .onReceive(timer) { time in
            viewModel.update(with: time)
        }
    }
}

#Preview {
    ContentView()
}
