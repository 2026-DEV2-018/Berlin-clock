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
    
    init(clock: BerlinClock) {
        self.clock = clock
    }
    
    func update(with date: Date) {
        
    }
}
