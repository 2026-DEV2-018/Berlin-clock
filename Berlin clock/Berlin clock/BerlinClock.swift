//
//  BerlinClock.swift
//  Berlin clock
//
//  Created by 2026-DEV2-018 on 14/01/2026.
//

struct BerlinClock {
    
    let numberOfFiveHourLamps = 4
    let numberOfOneHourLamps = 4
    let numberOfFiveMinuteLamps = 11
    let numberOfOneMinuteLamps = 4
    
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
        
        var lamps = lampsRow(totalLamps: numberOfFiveMinuteLamps, totalActiveLamps: numberOfActiveLamps, lampColor: .yellow)
        
        for index in 0 ..< numberOfActiveLamps {
            if (index + 1) % 3 == 0 {
                lamps[index] = .red
            }
        }
        
        return lamps
    }
    
    func oneMinutesRow(minutes: Int) -> [Lamp] {
        let numberOfActiveLamps = minutes % 5
        return lampsRow(totalLamps: numberOfOneMinuteLamps, totalActiveLamps: numberOfActiveLamps, lampColor: .yellow)
    }
    
    // MARK: - Helper method to create rows
    
    private func lampsRow(totalLamps: Int, totalActiveLamps: Int, lampColor: Lamp) -> [Lamp] {
        var lamps: [Lamp] = Array(repeating: .off, count: totalLamps)
        
        for index in 0 ..< totalActiveLamps {
            lamps[index] = lampColor
        }
        
        return lamps
    }
}
