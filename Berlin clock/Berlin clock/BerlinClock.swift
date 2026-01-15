//
//  BerlinClock.swift
//  Berlin clock
//
//  Created by 2026-DEV2-018 on 14/01/2026.
//

import Foundation

struct BerlinClock {
    
    let numberOfFiveHourLamps = 4
    let numberOfOneHourLamps = 4
    let numberOfFiveMinuteLamps = 11
    let numberOfOneMinuteLamps = 4
    
    let date: Date
    
    func secondsLampIluminated(seconds: Int) -> Bool {
        seconds % 2 == 0
    }
    
    func fiveHoursRow(hours: Int) -> [Lamp] {
        let numberOfActiveLamps = min(hours / 5, numberOfFiveHourLamps)
        return lampsRow(totalLamps: numberOfFiveHourLamps, totalActiveLamps: numberOfActiveLamps, lampColor: .red)
    }
    
    func oneHoursRow(hours: Int) -> [Lamp] {
        let numberOfActiveLamps = hours % 5
        return lampsRow(totalLamps: numberOfOneHourLamps, totalActiveLamps: numberOfActiveLamps, lampColor: .red)
    }
    
    func fiveMinutesRow(minutes: Int) -> [Lamp] {
        let numberOfActiveLamps = minutes / 5
        let lamps = lampsRow(totalLamps: numberOfFiveMinuteLamps, totalActiveLamps: numberOfActiveLamps, lampColor: .yellow)
        
        return lamps.enumerated().map { index, lamp in
            (index + 1) % 3 == 0 && lamp.isOn ? .red : lamp
        }
    }
    
    func oneMinutesRow(minutes: Int) -> [Lamp] {
        let numberOfActiveLamps = minutes % 5
        return lampsRow(totalLamps: numberOfOneMinuteLamps, totalActiveLamps: numberOfActiveLamps, lampColor: .yellow)
    }
    
    // MARK: - Helper method to create rows
    
    private func lampsRow(totalLamps: Int, totalActiveLamps: Int, lampColor: Lamp) -> [Lamp] {
        return (0..<totalLamps).map { $0 < totalActiveLamps ? lampColor : .off }
    }
}
