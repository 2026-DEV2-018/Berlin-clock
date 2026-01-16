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
    
    // MARK: - five hours
    
    private func assertFiveHoursRow(hours: Int, expectedLampsOn: Int) {
        let lamps = clock.fiveHoursRow(hours: hours)
        let numberOfIlluminatedLamps = lamps.filter { $0.isOn }.count
        XCTAssertEqual(numberOfIlluminatedLamps, expectedLampsOn)
    }
    
    func test_fiveHoursRow_returns_0_lamps_on_when_hours_is_0() {
        assertFiveHoursRow(hours: 0, expectedLampsOn: 0)
    }
    
    func test_fiveHoursRow_returns_0_lamps_on_when_hours_is_1() {
        assertFiveHoursRow(hours: 1, expectedLampsOn: 0)
    }
    
    func test_fiveHoursRow_returns_1_lamp_on_when_hours_is_5() {
        assertFiveHoursRow(hours: 5, expectedLampsOn: 1)
    }
    
    func test_fiveHoursRow_returns_1_lamp_on_when_hours_is_8() {
        assertFiveHoursRow(hours: 8, expectedLampsOn: 1)
    }
    
    func test_fiveHoursRow_returns_2_lamps_on_when_hours_is_10() {
        assertFiveHoursRow(hours: 10, expectedLampsOn: 2)
    }
    
    func test_fiveHoursRow_returns_3_lamps_on_when_hours_is_15() {
        assertFiveHoursRow(hours: 15, expectedLampsOn: 3)
    }
    
    func test_fiveHoursRow_returns_3_lamps_on_when_hours_is_19() {
        assertFiveHoursRow(hours: 19, expectedLampsOn: 3)
    }
    
    func test_fiveHoursRow_returns_4_lamps_on_when_hours_is_20() {
        assertFiveHoursRow(hours: 20, expectedLampsOn: 4)
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
        XCTAssertEqual(numberOfIlluminatedLamps, expectedLampsOn)
    }
    
    func test_fiveMinutesRow_returns_0_lamps_on_when_mintues_is_0() {
        assertFiveMinutesRow(minutes: 0, expectedLampsOn: 0)
    }
    
    func test_fiveMinutesRow_returns_1_lamp_on_when_mintues_is_5() {
        assertFiveMinutesRow(minutes: 5, expectedLampsOn: 1)
    }
    
    func test_fiveMinutesRow_returns_2_lamp_on_when_mintues_is_10() {
        assertFiveMinutesRow(minutes: 10, expectedLampsOn: 2)
    }
    
    func test_fiveMinutesRow_returns_3_lamps_on_when_mintues_is_15() {
        assertFiveMinutesRow(minutes: 15, expectedLampsOn: 3)
    }
    
    func test_fiveMinutesRow_returns_4_lamps_on_when_minutes_is_20() {
        assertFiveMinutesRow(minutes: 20, expectedLampsOn: 4)
    }
    
    func test_fiveMinutesRow_returns_5_lamps_on_when_minutes_is_25() {
        assertFiveMinutesRow(minutes: 25, expectedLampsOn: 5)
    }
    
    func test_fiveMinutesRow_returns_6_lamps_on_when_minutes_is_30() {
        assertFiveMinutesRow(minutes: 30, expectedLampsOn: 6)
    }
    
    func test_fiveMinutesRow_returns_7_lamps_on_when_minutes_is_35() {
        assertFiveMinutesRow(minutes: 35, expectedLampsOn: 7)
    }
    
    func test_fiveMinutesRow_returns_8_lamps_on_when_minutes_is_40() {
        assertFiveMinutesRow(minutes: 40, expectedLampsOn: 8)
    }
    
    func test_fiveMinutesRow_returns_9_lamps_on_when_minutes_is_45() {
        assertFiveMinutesRow(minutes: 45, expectedLampsOn: 9)
    }
    
    func test_fiveMinutesRow_returns_10_lamps_on_when_minutes_is_50() {
        assertFiveMinutesRow(minutes: 50, expectedLampsOn: 10)
    }
    
    func test_fiveMinutesRow_returns_11_lamps_on_when_minutes_is_55() {
        assertFiveMinutesRow(minutes: 55, expectedLampsOn: 11)
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
    
    // MARK: - Full Berlin clock
    
    func test_full_berlin_clock_with_time_9_hours_47_minutes_24_seconds_all_rows_have_the_correct_lamp_order() {
        
        let fiveHourLamps = clock.fiveHoursRow(hours: 9)
        let onehourLamps = clock.oneHoursRow(hours: 9)
        let fiveMinuteLamps = clock.fiveMinutesRow(minutes: 47)
        let oneMinuteLamps = clock.oneMinutesRow(minutes: 47)
        let isSecondsLampIlumminated = clock.secondsLampIluminated(seconds: 24)
        
        let expectedFiveHourOrder: [Lamp] = [.red, .off, .off, .off]
        let expectedOneHourOrder: [Lamp] = [.red, .red, .red, .red]
        let expectedFiveMinuteOrder: [Lamp] = [.yellow, .yellow, .red, .yellow, .yellow, .red, .yellow, .yellow, .red, .off, .off]
        let expectedOneMinuteOrder: [Lamp] = [.yellow, .yellow, .off, .off]
        
        XCTAssertEqual(fiveHourLamps,
                       expectedFiveHourOrder,
                       "fiveHoursRow is icorrect for 9:47:24, got: \(fiveHourLamps.map { $0.rawValue } ), expected: \(expectedFiveHourOrder.map { $0.rawValue })")
        XCTAssertEqual(onehourLamps,
                       expectedOneHourOrder,
                       "oneHoursRow is incorrect for 9:47:24, got: \(onehourLamps.map { $0.rawValue } ), expected: \(expectedOneHourOrder.map { $0.rawValue })")
        XCTAssertEqual(fiveMinuteLamps,
                       expectedFiveMinuteOrder,
                       "fiveMinutesRow is incorrect for 9:47:24, got: \(fiveMinuteLamps.map { $0.rawValue } ), expected: \(expectedFiveMinuteOrder.map { $0.rawValue })")
        XCTAssertEqual(oneMinuteLamps,
                       expectedOneMinuteOrder,
                       "oneMinutesRow is incorrect for 9:47:24, got: \(oneMinuteLamps.map { $0.rawValue } ), expected: \(expectedOneMinuteOrder.map { $0.rawValue })")
        XCTAssertTrue(isSecondsLampIlumminated, "secondLampIlluminated is incorrect for 9:47:24, expected: true but got \(isSecondsLampIlumminated)")
    }
}
