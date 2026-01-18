//
//  ViewModelTwo.swift
//  Berlin clock
//
//  Created by 2026-DEV2-018 on 17/01/2026.
//

import Foundation

@MainActor
class BerlinClockViewModel {
    
    private let clock: BerlinClock
    
    var isSecondsLampIluminated: Bool = false
    var fiveHourLamps: [Lamp] = []
    var oneHourLamps: [Lamp] = []
    var fiveMinuteLamps: [Lamp] = []
    
    init(clock: BerlinClock) {
        self.clock = clock
    }
    
    func update(with date: Date) {
        let seconds = Calendar.current.component(.second, from: date)
        isSecondsLampIluminated = clock.isSecondsLampIluminated(seconds: seconds)
        
        let hours = Calendar.current.component(.hour, from: date)
        fiveHourLamps = clock.fiveHoursRow(hours: hours)
        oneHourLamps = clock.oneHoursRow(hours: hours)
        
        let minutes = Calendar.current.component(.minute, from: date)
        fiveMinuteLamps = clock.fiveMinutesRow(minutes: minutes)
    }
}
