//
//  ViewModelTwo.swift
//  Berlin clock
//
//  Created by 2026-DEV2-018 on 17/01/2026.
//

import Foundation
import Combine

@Observable
class BerlinClockViewModel {
    
    // MARK: - Private properties
    
    @ObservationIgnored
    private lazy var timeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter
    }()
    
    private let clock: BerlinClock
    
    // MARK: - Public properties
    
    private(set) var isSecondsLampIluminated: Bool = false
    private(set) var fiveHourLamps: [Lamp] = []
    private(set) var oneHourLamps: [Lamp] = []
    private(set) var fiveMinuteLamps: [Lamp] = []
    private(set) var oneMinuteLamps: [Lamp] = []
    
    private(set) var digitalTime: String = ""
    
    // MARK: - Initializer
    
    init(clock: BerlinClock) {
        self.clock = clock
    }
    
    // MARK: - Methods
    
    func update(with date: Date) {
        let calendar = Calendar.current
        let seconds = calendar.component(.second, from: date)
        isSecondsLampIluminated = clock.isSecondsLampIluminated(seconds: seconds)
        
        let hours = calendar.component(.hour, from: date)
        fiveHourLamps = clock.fiveHoursRow(hours: hours)
        oneHourLamps = clock.oneHoursRow(hours: hours)
        
        let minutes = calendar.component(.minute, from: date)
        fiveMinuteLamps = clock.fiveMinutesRow(minutes: minutes)
        oneMinuteLamps = clock.oneMinutesRow(minutes: minutes)
        
        digitalTime = timeFormatter.string(from: date)
    }
}
