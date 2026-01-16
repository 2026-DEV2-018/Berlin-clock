//
//  Berlin_clockTests.swift
//  Berlin clockTests
//
//  Created by 2026-DEV2-018 on 13/01/2026.
//

import XCTest
@testable import Berlin_clock

final class Berlin_clockTests: XCTestCase {
    
    private var clock: BerlinClock!
    
    override func setUp() {
        super.setUp()
        clock = BerlinClock()
    }
    
    override func tearDown() {
        clock = nil
        super.tearDown()
    }
    
    // MARK: - seconds
    
    func test_seconds_lamp_is_on_when_it_is_even() {
        XCTAssertTrue(clock.secondsLampIluminated(seconds: 0))
    }
    
    func test_seconds_lamp_is_off_when_seconds_are_odd() {
        XCTAssertFalse(clock.secondsLampIluminated(seconds: 1))
    }
    
    func test_seconds_lamp_is_off_when_seconds_is_58() {
        XCTAssertFalse(clock.secondsLampIluminated(seconds: 58))
    }
    
    func test_seconds_lamp_is_off_when_seconds_is_59() {
        XCTAssertFalse(clock.secondsLampIluminated(seconds: 59))
    }
    
    // MARK: - five hours
    
    private func assertFiveHoursRow(hours: Int, expectedLampsOn: Int) {
        let lamps = clock.fiveHoursRow(hours: hours)
        let numberOfIlluminatedLamps = lamps.filter { $0.isOn }.count
        XCTAssertEqual(numberOfIlluminatedLamps, expectedLampsOn, "fiveHoursRow failed for \nhours: \(hours) \nexpected: \(expectedLampsOn) illuminated lamp\(expectedLampsOn > 1 ? "s" : "") \ngot: \(numberOfIlluminatedLamps)")
    }
    
    func test_fiveHoursRow_returns_correct_number_of_lamps_on_for_every_multiplication_of_five() {
        for hour in stride(from: 0, to: 24, by: 5) {
            let expectedLampsOn = hour / 5
            assertFiveHoursRow(hours: hour, expectedLampsOn: expectedLampsOn)
        }
    }
    
    func test_fiveHoursRow_returns_0_lamps_on_when_hours_is_1() {
        assertFiveHoursRow(hours: 1, expectedLampsOn: 0)
    }
    
    func test_fiveHoursRow_returns_1_lamp_on_when_hours_is_8() {
        assertFiveHoursRow(hours: 8, expectedLampsOn: 1)
    }
    
    func test_fiveHoursRow_returns_3_lamps_on_when_hours_is_19() {
        assertFiveHoursRow(hours: 19, expectedLampsOn: 3)
    }
    
    func test_fiveHoursRow_returns_4_lamps_on_when_hours_is_23() {
        assertFiveHoursRow(hours: 23, expectedLampsOn: 4)
    }
    
    func test_fiveHoursRow_returns_correct_number_of_lamps() {
        let lamps = clock.fiveHoursRow(hours: 0)
        XCTAssertEqual(lamps.count, 4)
    }
    
    // MARK: - One hour
    
    private func assertOneHoursRow(hours: Int, expectedLampsOn: Int) {
        let lamps = clock.oneHoursRow(hours: hours)
        let numberOfIlluminatedLamps = lamps.filter { $0.isOn }.count
        XCTAssertEqual(numberOfIlluminatedLamps, expectedLampsOn)
    }
    
    func test_oneHoursRow_returns_0_lamps_on_when_hours_is_0() {
        assertOneHoursRow(hours: 0, expectedLampsOn: 0)
    }
    
    func test_oneHoursRow_returns_1_lamp_on_when_hours_is_1() {
        assertOneHoursRow(hours: 1, expectedLampsOn: 1)
    }
    
    func test_oneHoursRow_returns_2_lamps_on_when_hours_is_2() {
        assertOneHoursRow(hours: 2, expectedLampsOn: 2)
    }
    
    func test_oneHoursRow_returns_3_lamps_on_when_hours_is_3() {
        assertOneHoursRow(hours: 3, expectedLampsOn: 3)
    }
    
    func test_oneHoursRow_returns_4_lamps_on_when_hours_is_4() {
        assertOneHoursRow(hours: 4, expectedLampsOn: 4)
    }
    
    func test_oneHoursRow_returns_1_lamp_on_when_hours_is_5() {
        assertOneHoursRow(hours: 5, expectedLampsOn: 0)
    }
    
    func test_oneHoursRow_returns_3_lamps_on_when_hours_is_23() {
        assertOneHoursRow(hours: 23, expectedLampsOn: 3)
    }
    
    func test_oneHoursRow_returns_correct_number_of_lamps() {
        let lamps = clock.oneHoursRow(hours: 0)
        XCTAssertEqual(lamps.count, 4)
    }
    
    // MARK: - Five minutes
    
    func test_fiveMinutesRow_returns_correct_number_of_lamps() {
        let lamps = clock.fiveMinutesRow(minutes: 0)
        XCTAssertEqual(lamps.count, 11)
    }
    
    private func assertFiveMinutesRow(minutes: Int, expectedLampsOn: Int) {
        let lamps = clock.fiveMinutesRow(minutes: minutes)
        let numberOfIlluminatedLamps = lamps.filter(\.isOn).count
        
        XCTAssertEqual(numberOfIlluminatedLamps,
                       expectedLampsOn,
                       "fiveMinutesRow failed for \nminutes: \(minutes) \nexpected: \(expectedLampsOn) illuminated lamp\(expectedLampsOn > 1 ? "s" : "") \ngot: \(numberOfIlluminatedLamps)")
    }
    
    func test_fiveMinutesRow_returns_correct_number_of_lamps_on_for_every_multiplication_of_five() {
        for minute in stride(from: 0, to: 60, by: 5) {
            let expectedLampsOn = minute / 5
            assertFiveMinutesRow(minutes: minute, expectedLampsOn: expectedLampsOn)
        }
    }
    
    func test_fiveMinutesRow_returns_11_lamps_on_when_minutes_is_59() {
        assertFiveMinutesRow(minutes: 59, expectedLampsOn: 11)
    }
    
    // MARK: - Five minutes rows every third row red
    
    func test_fiveMinutesRow_returns_3rd_lamp_red_when_minutes_is_15() {
        let lamps = clock.fiveMinutesRow(minutes: 15)
        let thirdLamp = lamps[2]
        XCTAssertTrue(thirdLamp == .red)
    }
    
    func test_fiveMinutesRow_returns_6th_lamp_red_when_minutes_is_30() {
        let lamps = clock.fiveMinutesRow(minutes: 30)
        let sixthLamp = lamps[5]
        XCTAssertTrue(sixthLamp == .red)
    }
    
    func test_fiveMinutesRow_returns_9th_lamp_red_when_minutes_is_45() {
        let lamps = clock.fiveMinutesRow(minutes: 45)
        let ninthLamp = lamps[8]
        XCTAssertTrue(ninthLamp == .red)
    }
    
    func test_fiveMinutesRow_has_red_lamp_on_every_third_position_for_illuminated_lamps() {
        let lamps = clock.fiveMinutesRow(minutes: 55)
        let illuminatedLamps = lamps.filter { $0.isOn }

        let redLampsIndices = illuminatedLamps.enumerated().compactMap { index, lamp in
            lamp == .red ? index : nil
        }
        
        XCTAssertEqual(redLampsIndices, [2, 5, 8])
    }
    
    // MARK: - One minute
    
    func test_oneMinutesRow_returns_correct_number_of_lamps() {
        let lamps = clock.oneMinutesRow(minutes: 0)
        XCTAssertEqual(lamps.count, 4)
    }
    
    func assertOneMinutesRow(minutes: Int, expectedLampsOn: Int) {
        let lamps = clock.oneMinutesRow(minutes: minutes)
        let illuminatedLamps = lamps.filter(\.isOn)
        XCTAssertEqual(illuminatedLamps.count, expectedLampsOn)
    }
    
    func test_oneMinutesRow_returns_1_lamp_on_when_minutes_is_1() {
        assertOneMinutesRow(minutes: 1, expectedLampsOn: 1)
    }
    
    func test_oneMinutesRow_returns_2_lamps_on_when_minutes_is_2() {
        assertOneMinutesRow(minutes: 2, expectedLampsOn: 2)
    }
    
    func test_oneMinutesRow_returns_3_lamps_on_when_minutes_is_3() {
        assertOneMinutesRow(minutes: 3, expectedLampsOn: 3)
    }
    
    func test_oneMinutesRow_returns_4_lamps_on_when_minutes_is_4() {
        assertOneMinutesRow(minutes: 4, expectedLampsOn: 4)
    }
    
    func test_oneMinutesRow_returns_0_lamps_on_when_minutes_is_5() {
        assertOneMinutesRow(minutes: 5, expectedLampsOn: 0)
    }
    
    func test_oneMinutesRow_returns_1_lamp_on_when_minutes_is_6() {
        assertOneMinutesRow(minutes: 6, expectedLampsOn: 1)
    }
    
    func test_oneMinutesRow_returns_4_lamps_on_when_minutes_is_55() {
        assertOneMinutesRow(minutes: 59, expectedLampsOn: 4)
    }
    
    // MARK: - Helper full berlin clock
    
    private func assertLampRow(for actualLamps: [Lamp], expectedLamps: [Lamp], rowName: String, time: String) {
        XCTAssertEqual(actualLamps,
                       expectedLamps,
                       "\(name) is icorrect for \(time), got: \(actualLamps.map { $0.rawValue } ), expected: \(expectedLamps.map { $0.rawValue })")
    }
    
    // MARK: - Full Berlin clock
    
    func test_full_berlin_clock_with_time_9_hours_47_minutes_24_seconds_all_rows_have_the_correct_lamp_order() {
        
        let fiveHourLamps = clock.fiveHoursRow(hours: 9)
        let onehourLamps = clock.oneHoursRow(hours: 9)
        let fiveMinuteLamps = clock.fiveMinutesRow(minutes: 47)
        let oneMinuteLamps = clock.oneMinutesRow(minutes: 47)
        let isSecondsLampIlumminated = clock.secondsLampIluminated(seconds: 24)
        
        let expectedFiveHourLamps: [Lamp] = [.red, .off, .off, .off]
        let expectedOneHourLamps: [Lamp] = [.red, .red, .red, .red]
        let expectedFiveMinuteLamps: [Lamp] = [.yellow, .yellow, .red, .yellow, .yellow, .red, .yellow, .yellow, .red, .off, .off]
        let expectedOneMinuteLamps: [Lamp] = [.yellow, .yellow, .off, .off]
        
        let time = "9:47:24"
        
        assertLampRow(for: fiveHourLamps, expectedLamps: expectedFiveHourLamps, rowName: "fiveHoursRow", time: time)
        
        assertLampRow(for: onehourLamps, expectedLamps: expectedOneHourLamps, rowName: "oneHoursRow", time: time)
        
        assertLampRow(for: fiveMinuteLamps, expectedLamps: expectedFiveMinuteLamps, rowName: "fiveMinuteRow", time: time)
        
        assertLampRow(for: oneMinuteLamps, expectedLamps: expectedOneMinuteLamps, rowName: "oneMinutesRow", time: time)
        
        XCTAssertTrue(isSecondsLampIlumminated, "secondLampIlluminated is incorrect for \(time), expected: true but got \(isSecondsLampIlumminated)")
    }
    
    // MARK: - Negative values, should never happen but better safe than sorry (eg user input in a later stadium)
    
    func test_full_berlin_clock_negative_time_values_returns_all_lamps_off() {
        let fiveHourLamps = clock.fiveHoursRow(hours: -23)
        let onehourLamps = clock.oneHoursRow(hours: -23)
        let fiveMinuteLamps = clock.fiveMinutesRow(minutes: -59)
        let oneMinuteLamps = clock.oneMinutesRow(minutes: -59)
        let isSecondsLampIlumminated = clock.secondsLampIluminated(seconds: -10)
        
        let expectedFiveHourLamps: [Lamp] = [.off, .off, .off, .off]
        let expectedOneHourLamps: [Lamp] = [.off, .off, .off, .off]
        let expectedFiveMinuteLamps: [Lamp] = [.off, .off, .off, .off, .off, .off, .off, .off, .off, .off, .off]
        let expectedOneMinuteLamps: [Lamp] = [.off, .off, .off, .off]
        
        let time = "-23:59:10"
        
        assertLampRow(for: fiveHourLamps, expectedLamps: expectedFiveHourLamps, rowName: "fiveHoursRow", time: time)
        
        assertLampRow(for: onehourLamps, expectedLamps: expectedOneHourLamps, rowName: "oneHoursRow", time: time)
        
        assertLampRow(for: fiveMinuteLamps, expectedLamps: expectedFiveMinuteLamps, rowName: "fiveMinuteRow", time: time)
        
        assertLampRow(for: oneMinuteLamps, expectedLamps: expectedOneMinuteLamps, rowName: "oneMinutesRow", time: time)
        
        XCTAssertFalse(isSecondsLampIlumminated, "secondLampIlluminated is incorrect for \(time), expected: false but got \(isSecondsLampIlumminated)")
    }
}
