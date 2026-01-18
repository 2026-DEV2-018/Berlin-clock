//
//  ContentView.swift
//  Berlin clock
//
//  Created by 2026-DEV2-018 on 13/01/2026.
//

import SwiftUI
import Combine

struct BerlinClockView: View {
    
    // MARK: - Properties
    
    @State private var viewModel = BerlinClockViewModel(clock: BerlinClock())
    @State private var timeString: String = ""
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        VStack(spacing: .padding12) {
            
            secondsLamp
            
            createLampsRow(lamps: viewModel.fiveHourLamps)
            
            createLampsRow(lamps: viewModel.oneHourLamps)
            
            createLampsRow(lamps: viewModel.fiveMinuteLamps, lampHeight: .height50)
 
            createLampsRow(lamps: viewModel.oneMinuteLamps)
            
            Text(timeString)
                .bold()
                
        }
        .padding()
        .onReceive(timer) { time in
            viewModel.update(with: time)
            timeString = viewModel.formattedTime(for: time)
        }
    }
    
    // MARK: - View methods
    
    private var secondsLamp: some View {
        Circle()
            .fill(viewModel.isSecondsLampIluminated ? .yellow : .clear)
            .stroke(.black, lineWidth: .lineWidth)
            .frame(width: .height50, height: .height50)
    }
    
    private func createLampsRow(lamps: [Lamp], lampHeight: CGFloat = .height20) -> some View {
        HStack (spacing: .padding8) {
            ForEach(lamps, id: \.self) { lamp in
                Rectangle()
                    .fill(lamp.color)
                    .stroke(.black, lineWidth: .lineWidth)
                    .frame(height: lampHeight)
                    .frame(maxWidth: .infinity)
            }
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    BerlinClockView()
}
