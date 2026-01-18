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
                .fill(viewModel.isSecondsLampIluminated ? .yellow : .clear)
                .stroke(.black, lineWidth: 2)
                .frame(width: 50, height: 50)
            
            
            createRows(lamps: viewModel.fiveHourLamps)
            
            createRows(lamps: viewModel.oneHourLamps)
            
            createRows(lamps: viewModel.fiveMinuteLamps)
 
            createRows(lamps: viewModel.oneMinuteLamps)
                
        }
        .padding()
        .onReceive(timer) { time in
            viewModel.update(with: time)
        }
    }
    
    func createRows(lamps: [Lamp], lampHeight: CGFloat = 50) -> some View {
        HStack (spacing: 8) {
            ForEach(lamps, id: \.self) { lamp in
                Rectangle()
                    .fill(lamp.color)
                    .stroke(.black, lineWidth: 2)
                    .frame(height: lampHeight)
                    .frame(maxWidth: .infinity)
            }
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    ContentView()
}
