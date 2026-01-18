//
//  BerlinClockViewModelTests.swift
//  Berlin clockTests
//
//  Created by 2026-DEV2-018 on 16/01/2026.
//

import XCTest
@testable import Berlin_clock

final class BerlinClockViewModelTests: XCTestCase {
    
    private var clock: BerlinClock!
    private var viewModel: BerlinClockViewModel!
    
    override func setUp() async throws {
        try await super.setUp()
        clock = await BerlinClock()
        viewModel = await BerlinClockViewModel(clock: clock)
    }
    
    override func tearDown() async throws {
        clock = nil
        viewModel = nil
        try await super.tearDown()
    }
    
    private func updateViewModel(for dateComponents: DateComponents) async {
        let date = Calendar.current.date(from: dateComponents)!
        await viewModel.update(with: date)
    }
    
    // MARK: - Seconds

    func test_update_with_even_seconds_sets_seconds_lamps_on() async {
        let dateConponents = DateComponents(hour: 9, minute: 0, second: 0)
        
        await updateViewModel(for: dateConponents)
        
        let isSecondsLampIluminated = await viewModel.isSecondsLampIluminated
        XCTAssertTrue(isSecondsLampIluminated)
    }
    
    func test_update_with_uneven_seconds_sets_seconds_lamps_off() async {
        let dateConponents = DateComponents(hour: 9, minute: 0, second: 1)
        
        await updateViewModel(for: dateConponents)
        
        let isSecondsLampIluminated = await viewModel.isSecondsLampIluminated
        XCTAssertFalse(isSecondsLampIluminated)
    }
    
    // MARK: - Correct number of lamps
    
    func test_update_sets_fiveHourLamps_for_date_with_correct_number_of_lamps() async {
        let dateComponents = DateComponents(hour: 9, minute: 0, second: 0)
        
        await updateViewModel(for: dateComponents)
        
        let fiveHourLamps = await viewModel.fiveHourLamps
        
        XCTAssertEqual(fiveHourLamps.count, 4)
    }
    
    func test_update_sets_oneHoursLamps_for_date_with_correct_number_of_lamps() async {
        let dateComponents = DateComponents(hour: 9, minute: 0, second: 0)

        await updateViewModel(for: dateComponents)
        
        let oneHourLamps = await viewModel.oneHourLamps
        XCTAssertEqual(oneHourLamps.count, 4)
    }
    
    func test_update_sets_fiveMinuteLamps_for_date_with_correct_number_of_lamps() async {
        let dateComponents = DateComponents(hour: 9, minute: 0, second: 0)
        
        await updateViewModel(for: dateComponents)
        
        let fiveMinuteLamps = await viewModel.fiveMinuteLamps
        XCTAssertEqual(fiveMinuteLamps.count, 11)
    }
    
    func test_update_sets_oneMinuteLamps_for_date_with_correct_number_of_lamps() async {
        let dateComponents = DateComponents(hour: 9, minute: 0, second: 0)
        
        await updateViewModel(for: dateComponents)
        
        let oneMinuteLamps = await viewModel.oneMinuteLamps
        
        XCTAssertEqual(oneMinuteLamps.count, 4)
    }
    
    // MARK: - Updates
    
    func test_update_overrides_previous_state() async {
        
        await updateViewModel(for: DateComponents(hour: 12, minute: 0, second: 0))
        let fiveHourLamps = await viewModel.fiveHourLamps
        let oneHourLamps = await viewModel.oneHourLamps
        let fiveMinuteLamps = await viewModel.fiveMinuteLamps
        let oneMinuteLamps = await viewModel.oneMinuteLamps
        let isSecondsLampIluminated = await viewModel.isSecondsLampIluminated
        
        XCTAssertEqual(fiveHourLamps, [.red, .red, .off, .off])
        XCTAssertEqual(oneHourLamps, [.red, .red, .off, .off])
        XCTAssertEqual(fiveMinuteLamps, [.off, .off, .off, .off, .off, .off, .off, .off, .off, .off, .off])
        XCTAssertEqual(oneMinuteLamps, [.off, .off,.off, .off])
        XCTAssertTrue(isSecondsLampIluminated)
        
        await updateViewModel(for: DateComponents(hour: 13, minute: 31, second: 59))
        let newFiveHourLamps = await viewModel.fiveHourLamps
        let newOneHourLamps = await viewModel.oneHourLamps
        let newFiveMinuteLamps = await viewModel.fiveMinuteLamps
        let newOneMinuteLamps = await viewModel.oneMinuteLamps
        let newIsSecondsLampIlluminated = await viewModel.isSecondsLampIluminated
        
        XCTAssertEqual(newFiveHourLamps, [.red, .red, .off, .off])
        XCTAssertEqual(newOneHourLamps, [.red, .red, .red, .off])
        XCTAssertEqual(newFiveMinuteLamps, [.yellow, .yellow, .red, .yellow, .yellow, .red, .off, .off, .off, .off, .off])
        XCTAssertEqual(newOneMinuteLamps, [.yellow, .off,.off, .off])
        XCTAssertFalse(newIsSecondsLampIlluminated)
    }
    
    // MARK: - DateFormatter
    
    func test_formattedTime_returns_the_correct_time_format() async {
        let dateComponents = DateComponents(year: 2026,
                                            month: 0,
                                            day: 13,
                                            hour: 9,
                                            minute: 58,
                                            second: 3)
        let date = Calendar.current.date(from: dateComponents)!
        
        let timeString = await viewModel.formattedTime(for: date)
        
        XCTAssertEqual(timeString, "09:58")
    }
}
