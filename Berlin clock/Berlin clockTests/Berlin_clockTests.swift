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
    
    func test_five_hours_row_returns_correct_number_of_lamps() {
        let lamps = clock.fiveHoursRow(hours: 0)
        XCTAssertEqual(lamps.count, 4)
    }
    
    // MARK: - One hour
    
    private func assertOneHoursRow(hours: Int, expectedLampsOn: Int) {
        let lamps = clock.oneHoursRow(hours: hours)
        let numberOfIlluminatedLamps = lamps.filter { $0.isOn }.count
        XCTAssertEqual(numberOfIlluminatedLamps, expectedLampsOn)
    }
    
    func test_one_hours_row_returns_zero_lamps_on_when_hours_is_zero() {
        assertOneHoursRow(hours: 0, expectedLampsOn: 0)
    }
    
    func test_one_hours_row_returns_one_lamp_on_when_hours_is_one() {
        assertOneHoursRow(hours: 1, expectedLampsOn: 1)
    }
    
    func test_one_hours_row_returns_two_lamps_on_when_hours_is_two() {
        assertOneHoursRow(hours: 2, expectedLampsOn: 2)
    }
    
    func test_one_hours_row_returns_three_lamps_on_when_hours_is_three() {
        assertOneHoursRow(hours: 3, expectedLampsOn: 3)
    }
    
    func test_one_hours_row_returns_four_lamps_on_when_hours_is_four() {
        assertOneHoursRow(hours: 4, expectedLampsOn: 4)
    }
    
    func test_one_hours_row_returns_one_lamp_on_when_hours_is_five() {
        assertOneHoursRow(hours: 5, expectedLampsOn: 0)
    }
    
    func test_one_hours_row_returns_three_lamps_on_when_hours_is_twenty_three() {
        assertOneHoursRow(hours: 23, expectedLampsOn: 3)
    }
    
    func test_one_hours_row_returns_correct_number_of_lamps() {
        let lamps = clock.oneHoursRow(hours: 0)
        XCTAssertEqual(lamps.count, 4)
    }
    
    // MARK: - Five minutes
    
    func test_five_minutes_row_returns_correct_number_of_lamps() {
        let lamps = clock.fiveMinutesRow(minutes: 0)
        XCTAssertEqual(lamps.count, 11)
    }
    
    private func assertFiveMinutesRow(minutes: Int, expectedLampsOn: Int) {
        let lamps = clock.fiveMinutesRow(minutes: minutes)
        let numberOfIlluminatedLamps = lamps.filter(\.isOn).count
        XCTAssertEqual(numberOfIlluminatedLamps, expectedLampsOn)
    }
    
    func test_five_minutes_row_returns_zero_lamps_on_when_mintues_is_zero() {
        assertFiveMinutesRow(minutes: 0, expectedLampsOn: 0)
    }
    
    func test_five_minutes_row_returns_one_lamp_on_when_mintues_is_five() {
        assertFiveMinutesRow(minutes: 5, expectedLampsOn: 1)
    }
    
    func test_five_minutes_row_returns_two_lamp_on_when_mintues_is_ten() {
        assertFiveMinutesRow(minutes: 10, expectedLampsOn: 2)
    }
    
    func test_five_minutes_row_returns_three_lamps_on_when_mintues_is_fifteen() {
        assertFiveMinutesRow(minutes: 15, expectedLampsOn: 3)
    }
    
    func test_five_minutes_row_returns_four_lamps_on_when_minutes_is_twenty() {
        assertFiveMinutesRow(minutes: 20, expectedLampsOn: 4)
    }
    
    func test_five_minutes_row_returns_five_lamps_on_when_minutes_is_twentyFive() {
        assertFiveMinutesRow(minutes: 25, expectedLampsOn: 5)
    }
    
    func test_five_minutes_row_returns_six_lamps_on_when_minutes_is_thirty() {
        assertFiveMinutesRow(minutes: 30, expectedLampsOn: 6)
    }
    
    func test_five_minutes_row_returns_seven_lamps_on_when_minutes_is_thirtyFive() {
        assertFiveMinutesRow(minutes: 35, expectedLampsOn: 7)
    }
    
    func test_five_minutes_row_returns_eight_lamps_on_when_minutes_is_forty() {
        assertFiveMinutesRow(minutes: 40, expectedLampsOn: 8)
    }
    
    func test_five_minutes_row_returns_nine_lamps_on_when_minutes_is_forty_five() {
        assertFiveMinutesRow(minutes: 45, expectedLampsOn: 9)
    }
    
    func test_five_minutes_row_returns_ten_lamps_on_when_minutes_is_fifty() {
        assertFiveMinutesRow(minutes: 50, expectedLampsOn: 10)
    }
    
    func test_five_minutes_row_returns_eleven_lamps_on_when_minutes_is_fifty_five() {
        assertFiveMinutesRow(minutes: 55, expectedLampsOn: 11)
    }
    
    // MARK: - Five minutes rows every third row red
    
    func test_five_minutes_row_returns_third_lamp_red_when_minutes_is_fifteen() {
        let lamps = clock.fiveMinutesRow(minutes: 15)
        let thirdLamp = lamps[2]
        XCTAssertTrue(thirdLamp == .red)
    }
    
    func test_five_minutes_row_returns_sixt_lamp_red_when_minutes_is_thirty() {
        let lamps = clock.fiveMinutesRow(minutes: 30)
        let sixthLamp = lamps[5]
        XCTAssertTrue(sixthLamp == .red)
    }
    
    func test_five_minutes_row_returns_ninth_lamp_red_when_minutes_is_forty_five() {
        let lamps = clock.fiveMinutesRow(minutes: 45)
        let ninthLamp = lamps[8]
        XCTAssertTrue(ninthLamp == .red)
    }
    
    func test_five_minutes_row_has_red_lamp_on_every_third_position_for_illuminated_lamps() {
        let lamps = clock.fiveMinutesRow(minutes: 55)
        let illuminatedLamps = lamps.filter { $0.isOn }

        let redLampsIndices = illuminatedLamps.enumerated().compactMap { index, lamp in
            lamp == .red ? index : nil
        }
        
        XCTAssertEqual(redLampsIndices, [2, 5, 8])
    }
    
    // MARK: - One minute
    
    func test_one_minutes_row_returns_correct_number_of_lamps() {
        let lamps = clock.oneMinutesRow(minutes: 0)
        XCTAssertEqual(lamps.count, 4)
    }
    
    func assertOneMinutesRow(minutes: Int, expectedLampsOn: Int) {
        let lamps = clock.oneMinutesRow(minutes: minutes)
        let illuminatedLamps = lamps.filter(\.isOn)
        XCTAssertEqual(illuminatedLamps.count, expectedLampsOn)
    }
    
    func test_one_minutes_row_returns_one_lamp_on_when_minutes_is_one() {
        assertOneMinutesRow(minutes: 1, expectedLampsOn: 1)
    }
    
    func test_one_minutes_row_returns_two_lamps_on_when_minutes_is_two() {
        assertOneMinutesRow(minutes: 2, expectedLampsOn: 2)
    }
    
    func test_one_minutes_row_returns_three_lamps_on_when_minutes_is_three() {
        assertOneMinutesRow(minutes: 3, expectedLampsOn: 3)
    }
}
