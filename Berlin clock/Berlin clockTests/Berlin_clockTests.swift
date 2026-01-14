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
}
