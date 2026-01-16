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
    
    func isSecondsLampIluminated(seconds: Int) -> Bool {
        guard seconds >= 0 && seconds <= 59 else { return false }
        
        return seconds % 2 == 0
    }
    
    func fiveHoursRow(hours: Int) -> [Lamp] {
        let numberOfActiveLamps = min(hours / 5, numberOfFiveHourLamps)
        
        return lampsRow(totalLamps: numberOfFiveHourLamps,
                        totalActiveLamps: numberOfActiveLamps,
                        lampColor: .red)
    }
    
    func oneHoursRow(hours: Int) -> [Lamp] {
        let numberOfActiveLamps = min(hours % 5, numberOfOneHourLamps)
        
        return lampsRow(totalLamps: numberOfOneHourLamps,
                        totalActiveLamps: numberOfActiveLamps,
                        lampColor: .red)
    }
    
    func fiveMinutesRow(minutes: Int) -> [Lamp] {
        let numberOfActiveLamps = min(minutes / 5, numberOfFiveMinuteLamps)
        
        let lamps = lampsRow(totalLamps: numberOfFiveMinuteLamps,
                             totalActiveLamps: numberOfActiveLamps,
                             lampColor: .yellow)
        
        return lamps.enumerated().map { index, lamp in
            // make every third lamp red when it's on
            (index + 1) % 3 == 0 && lamp.isOn ? .red : lamp
        }
    }
    
    func oneMinutesRow(minutes: Int) -> [Lamp] {
        let numberOfActiveLamps = min(minutes % 5, numberOfOneMinuteLamps)
        
        return lampsRow(totalLamps: numberOfOneMinuteLamps,
                        totalActiveLamps: numberOfActiveLamps,
                        lampColor: .yellow)
    }
    
    // MARK: - Helper method to create rows
    
    private func lampsRow(totalLamps: Int, totalActiveLamps: Int, lampColor: Lamp) -> [Lamp] {
        return (0..<totalLamps).map { $0 < totalActiveLamps ? lampColor : .off }
    }
}
