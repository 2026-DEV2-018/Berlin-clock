//
//  Berlin_clockTests.swift
//  Berlin clockTests
//
//  Created by 2026-DEV2-018 on 13/01/2026.
//

import XCTest
@testable import Berlin_clock

final class Berlin_clockTests: XCTestCase {

  // MARK: - seconds
    
    func test_seconds_lamp_is_on_when_it_is_even() {
        let clock = BerlinClock()
        
        XCTAssertTrue(clock.secondsLampIluminated(seconds: 0))
    }
    
    func test_seconds_lamp_is_off_when_seconds_are_odd() {
        let clock = BerlinClock()
        XCTAssertFalse(clock.secondsLampIluminated(seconds: 1))
    }
    
    // MARK: - five hours
    
    private func assertFiveHoursRow(hours: Int, expectedLampsOn: Int) {
        let clock = BerlinClock()
        let lamps = clock.fiveHoursRow(hours: hours)
        let numberOfIlluminatedLamps = lamps.filter { $0.isOn }.count
        XCTAssertEqual(numberOfIlluminatedLamps, expectedLampsOn)
    }
    
    func test_five_hours_row_returns_four_lamps_on_when_hours_is_zero() {
        assertFiveHoursRow(hours: 0, expectedLampsOn: 0)
    }
    
    func test_five_hours_row_returns_zero_lamps_on_when_hours_is_one() {
        assertFiveHoursRow(hours: 1, expectedLampsOn: 0)
    }
    
    func test_five_hours_row_returns_one_lamp_on_for_five_hours() {
        assertFiveHoursRow(hours: 5, expectedLampsOn: 1)
    }
    
    func test_five_hours_row_returns_one_lamp_on_when_hours_is_eight() {
        assertFiveHoursRow(hours: 8, expectedLampsOn: 1)
    }
    
    func test_five_hours_row_returns_two_lamps_on_when_hours_is_ten() {
        assertFiveHoursRow(hours: 10, expectedLampsOn: 2)
    }
    
    func test_five_hours_row_returns_three_lamps_on_when_hours_is_fifteen() {
        assertFiveHoursRow(hours: 15, expectedLampsOn: 3)
    }
    
    func test_five_hours_row_returns_three_lamps_on_when_hours_is_nineteen() {
        assertFiveHoursRow(hours: 19, expectedLampsOn: 3)
    }
    
    func test_five_hours_row_returns_four_lamps_on_when_hours_is_twenty() {
        assertFiveHoursRow(hours: 20, expectedLampsOn: 4)
    }
    
    func test_five_hours_row_returns_four_lamps_on_when_hours_is_twenty_three() {
        assertFiveHoursRow(hours: 23, expectedLampsOn: 4)
    }
    
    // MARK: - One hour
    
    func test_one_hours_row_returns_zero_lamps_on_when_hours_is_zero() {
        let clock = BerlinClock()
        let lamps = clock.oneHoursRow(hours: 0)
        let numberOfIlluminatedLamps = lamps.filter(\.isOn).count
        XCTAssertEqual(numberOfIlluminatedLamps, 0)
    }
    
    func test_one_hours_row_returns_one_lamp_on_when_hours_is_one() {
        let clock = BerlinClock()
        let lamps = clock.oneHoursRow(hours: 1)
        let numberOfIlluminatedLamps = lamps.filter(\.isOn).count
        XCTAssertEqual(numberOfIlluminatedLamps, 1)
    }
    
    func test_one_hours_row_returns_two_lamps_on_when_hours_is_two() {
        let clock = BerlinClock()
        let lamps = clock.oneHoursRow(hours: 2)
        let numberOfIlluminatedLamps = lamps.filter(\.isOn).count
        XCTAssertEqual(numberOfIlluminatedLamps, 2)
    }
    
    func test_one_hours_row_returns_three_lamps_on_when_hours_is_three() {
        let clock = BerlinClock()
        let lamps = clock.oneHoursRow(hours: 3)
        let numberOfIlluminatedLamps = lamps.filter(\.isOn).count
        XCTAssertEqual(numberOfIlluminatedLamps, 3)
    }
    
    func test_one_hours_row_returns_four_lamps_on_when_hours_is_four() {
        let clock = BerlinClock()
        let lamps = clock.oneHoursRow(hours: 4)
        let numberOfIlluminatedLamps = lamps.filter(\.isOn).count
        XCTAssertEqual(numberOfIlluminatedLamps, 4)
    }
}
