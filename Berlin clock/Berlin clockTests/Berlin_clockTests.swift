//
//  Berlin_clockTests.swift
//  Berlin clockTests
//
//  Created by 2026-DEV2-018 on 13/01/2026.
//

import XCTest
@testable import Berlin_clock

final class Berlin_clockTests: XCTestCase {

  
    func test_seconds_lamp_is_on_when_it_is_even() {
        let clock = BerlinClock()
        
        XCTAssertTrue(clock.secondsLampIluminated(seconds: 0))
    }
    
    func test_seconds_lamp_is_off_when_seconds_are_odd() {
        let clock = BerlinClock()
        XCTAssertFalse(clock.secondsLampIluminated(seconds: 1))
    }
    
    func test_five_hours_row_returns_one_lamp_on_for_five_hours() {
        let clock = BerlinClock()
        let lamps = clock.fiveHoursRow(hours: 5)
        let numberOfIlluminatedLamps = lamps.filter { $0.isOn }.count
        XCTAssertEqual(lamps.count, 1)
    }
}
