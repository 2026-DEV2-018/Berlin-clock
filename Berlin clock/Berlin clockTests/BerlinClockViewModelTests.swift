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
    

    func test_update_with_even_seconds_sets_seconds_lamps_on() async {
        let dateConponents = DateComponents(hour: 9, minute: 0, second: 0)
        
        await updateViewModel(for: dateConponents)
        
        let isSecondsLampIluminated = await viewModel.isSecondsLampIluminated
        XCTAssertTrue(isSecondsLampIluminated)
    }
    
    // MARK: - Correct number of lamps
    
    func test_update_sets_five_hour_lamps_for_date_with_correct_number_of_lamps() async {
        let dateConponents = DateComponents(hour: 9, minute: 0, second: 0)
        
        await updateViewModel(for: dateConponents)
        
        let fiveHourLamps = await viewModel.fiveHourLamps
        
        XCTAssertEqual(fiveHourLamps.count, 4)
    }
    
    func test_update_sets_oneHoursLamps_for_date_with_correct_number_of_lamps() async {
        let dateConponents = DateComponents(hour: 9, minute: 0, second: 0)

        await updateViewModel(for: dateConponents)
        
        let oneHourLamps = await viewModel.oneHourLamps
        XCTAssertEqual(oneHourLamps.count, 4)
    }
    
    func test_update_sets_fiveMinuteLamps_for_date_with_correct_number_of_lamps() async {
        let dateConponents = DateComponents(hour: 9, minute: 0, second: 0)
        
        await updateViewModel(for: dateConponents)
        
        let fiveMinuteLamps = await viewModel.fiveMinuteLamps
        XCTAssertEqual(fiveMinuteLamps.count, 11)
    }
    
    func test_update_sets_oneMinuteLamps_for_date_with_correct_number_of_lamps() async {
        let dateConponents = DateComponents(hour: 9, minute: 0, second: 0)
        
        await updateViewModel(for: dateConponents)
        
        let oneMinuteLamps = await viewModel.oneMinuteLamps
        
        XCTAssertEqual(oneMinuteLamps.count, 4)
    }

    // MARK: - Correct lamps
    
    private func assertFiveHourLamps(hours: Int, expectedLamps: [Lamp]) async {
        let dateConponents = DateComponents(hour: hours, minute: 0, second: 0)
        
        await updateViewModel(for: dateConponents)
        let fiveHourLamps = await viewModel.fiveHourLamps
        
        XCTAssertEqual(fiveHourLamps, expectedLamps)
    }
    
    func test_update_sets_correct_fiveHourLamps_for_midnight() async {
        let expectedLamps: [Lamp] = [.off, .off, .off, .off]
        
        await assertFiveHourLamps(hours: 0, expectedLamps: expectedLamps)
    }
    
    func test_update_sets_correct_fiveHourLamps_for_1_hour() async {
        let expectedLamps: [Lamp] = [.off, .off, .off, .off]
        
        await assertFiveHourLamps(hours: 1, expectedLamps: expectedLamps)
    }
    
    func test_update_sets_correct_fiveHourLamps_for_12_hours() async {
        let expectedLamps: [Lamp] = [.red, .red, .off, .off]
        
        await assertFiveHourLamps(hours: 12, expectedLamps: expectedLamps)
    }
    
    func test_update_sets_correct_fiveHourLamps_for_23_hours() async {
        let expectedLamps: [Lamp] = [.red, .red, .red, .red]
        
        await assertFiveHourLamps(hours: 23, expectedLamps: expectedLamps)
    }
    
    // MARK: - One hour
    
    private func assertOneHourLamps(hours: Int, expectedLamps: [Lamp]) async {
        let dateComponents = DateComponents(hour: hours, minute: 0, second: 0)
        
        await updateViewModel(for: dateComponents)
        let oneHourLamps = await viewModel.oneHourLamps
        
        XCTAssertEqual(oneHourLamps, expectedLamps)
    }
    
    func test_update_sets_correct_oneHourLamps_for_midnight() async {
        let expectedLamps: [Lamp] = [.off, .off, .off, .off]
        await assertOneHourLamps(hours: 0, expectedLamps: expectedLamps)
    }
    
    func test_update_sets_correct_oneHourLamps_for_1_hour() async {
        let expectedLamps: [Lamp] = [.red, .off, .off, .off]
        await assertOneHourLamps(hours: 1, expectedLamps: expectedLamps)
    }
    
    func test_update_sets_correct_oneHourLamps_for_5_hours() async {
        let expectedLamps: [Lamp] = [.off, .off, .off, .off]
        await assertOneHourLamps(hours: 5, expectedLamps: expectedLamps)
    }
    
    func test_update_sets_correct_oneHourLamps_for_23_hours() async {
        let expectedLamps: [Lamp] = [.red, .red, .red, .off]
        await assertOneHourLamps(hours: 23, expectedLamps: expectedLamps)
    }
    
    // MARK: - Five minutes
    
    func test_update_sets_correct_fiveMinuteLamps_for_midnight() async {
        let dateComponents = DateComponents(hour: 0, minute: 0, second: 0)
        
        await updateViewModel(for: dateComponents)
        let fiveMinuteLamps = await viewModel.fiveMinuteLamps
        
        let expectedLamps: [Lamp] = [.off, .off, .off, .off, .off, .off, .off, .off, .off, .off, .off]
        XCTAssertEqual(fiveMinuteLamps, expectedLamps)
    }
}
