//
//  BerlinClock.swift
//  Berlin clock
//
//  Created by 2026-DEV2-018 on 14/01/2026.
//

struct BerlinClock {
    
    func secondsLampIluminated(seconds: Int) -> Bool {
        seconds % 2 == 0
    }
    
    func fiveHoursRow(hours: Int) -> [Lamp] {
        let active = hours / 5
        
        if active == 0 {
            return [.off, .off, .off, .off]
        }
        
        if active == 2 {
            return [.red, .red, .off, .off]
        }
        
        return [.red, .off, .off, .off]
    }
}
