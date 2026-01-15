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
        
        var lamps: [Lamp] = Array(repeating: .off, count: numberOfFiveHourLamps)
        
        for index in 0 ..< numberOfActiveLamps {
            lamps[index] = .red
        }
        return lamps
    }
    
    func oneHoursRow(hours: Int) -> [Lamp] {
        let numberOfActiveLamps = hours % 5
        
        var lamps: [Lamp] = Array(repeating: .off, count: numberOfOneHourLamps)
        
        for index in 0 ..< numberOfActiveLamps {
            lamps[index] = .red
        }
        
        return lamps
    }
    
    func fiveMinutesRow(minutes: Int) -> [Lamp] {
        let numberOfActiveLamps = minutes / 5
        
        var lamps: [Lamp] = Array(repeating: .off, count: numberOfFiveMinuteLamps)
        
        for index in 0 ..< numberOfActiveLamps {
            lamps[index] = .yellow
        }
        
        for index in 0 ..< numberOfActiveLamps {
            if (index + 1) % 3 == 0 {
                lamps[index] = .red
            }
        }
        
        return lamps
    }
    
    func oneMinutesRow(minutes: Int) -> [Lamp] {
        let numberOfActiveLamps = minutes % 5
        
        var lamps: [Lamp] = Array(repeating: .off, count: numberOfOneMinuteLamps)
        
        for index in 0 ..< numberOfActiveLamps {
            lamps[index] = .yellow
        }
        
        return lamps
    }
}
