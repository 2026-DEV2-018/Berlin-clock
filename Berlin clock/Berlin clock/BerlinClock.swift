//
//  BerlinClock.swift
//  Berlin clock
//
//  Created by 2026-DEV2-018 on 14/01/2026.
//

struct BerlinClock {
    
    let numberOfFiveHourLamps = 4
    
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
        
        if numberOfActiveLamps == 1 {
            return [.red, .off, .off, .off]
        }
        
        return [.off, .off, .off, .off]
    }
}
