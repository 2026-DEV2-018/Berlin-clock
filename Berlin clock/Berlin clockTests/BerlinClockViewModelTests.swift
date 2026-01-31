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
    
    override func setUp() {
        super.setUp()
        clock =  BerlinClock()
        viewModel =  BerlinClockViewModel(clock: clock)
    }
    
    override func tearDown() {
        clock = nil
        viewModel = nil
        super.tearDown()
    }
    
    private func updateViewModel(for dateComponents: DateComponents) {
        let date = Calendar.current.date(from: dateComponents)!
        viewModel.update(with: date)
    }
    
    // MARK: - Seconds

    func test_update_with_even_seconds_sets_seconds_lamps_on() {
        let dateConponents = DateComponents(hour: 9, minute: 0, second: 0)
        
         updateViewModel(for: dateConponents)
        
        let isSecondsLampIluminated =  viewModel.isSecondsLampIluminated
        XCTAssertTrue(isSecondsLampIluminated)
    }
    
    func test_update_with_uneven_seconds_sets_seconds_lamps_off() {
        let dateConponents = DateComponents(hour: 9, minute: 0, second: 1)
        
        updateViewModel(for: dateConponents)
        
        let isSecondsLampIluminated = viewModel.isSecondsLampIluminated
        XCTAssertFalse(isSecondsLampIluminated)
    }
    
    // MARK: - Correct number of lamps
    
    func test_update_sets_fiveHourLamps_for_date_with_correct_number_of_lamps() {
        let dateComponents = DateComponents(hour: 9, minute: 0, second: 0)
        
        updateViewModel(for: dateComponents)
        
        let fiveHourLamps = viewModel.fiveHourLamps
        
        XCTAssertEqual(fiveHourLamps.count, 4)
    }
    
    func test_update_sets_oneHoursLamps_for_date_with_correct_number_of_lamps() {
        let dateComponents = DateComponents(hour: 9, minute: 0, second: 0)

        updateViewModel(for: dateComponents)
        
        let oneHourLamps = viewModel.oneHourLamps
        XCTAssertEqual(oneHourLamps.count, 4)
    }
    
    func test_update_sets_fiveMinuteLamps_for_date_with_correct_number_of_lamps() {
        let dateComponents = DateComponents(hour: 9, minute: 0, second: 0)
        
        updateViewModel(for: dateComponents)
        
        let fiveMinuteLamps = viewModel.fiveMinuteLamps
        XCTAssertEqual(fiveMinuteLamps.count, 11)
    }
    
    func test_update_sets_oneMinuteLamps_for_date_with_correct_number_of_lamps() {
        let dateComponents = DateComponents(hour: 9, minute: 0, second: 0)
        
        updateViewModel(for: dateComponents)
        
        let oneMinuteLamps = viewModel.oneMinuteLamps
        
        XCTAssertEqual(oneMinuteLamps.count, 4)
    }
    
    // MARK: - Updates
    
    func test_update_overrides_previous_state() {
        
        updateViewModel(for: DateComponents(hour: 12, minute: 0, second: 0))
        let fiveHourLamps = viewModel.fiveHourLamps
        let oneHourLamps = viewModel.oneHourLamps
        let fiveMinuteLamps =  viewModel.fiveMinuteLamps
        let oneMinuteLamps =  viewModel.oneMinuteLamps
        let isSecondsLampIluminated =  viewModel.isSecondsLampIluminated
        
        XCTAssertEqual(fiveHourLamps, [.red, .red, .off, .off])
        XCTAssertEqual(oneHourLamps, [.red, .red, .off, .off])
        XCTAssertEqual(fiveMinuteLamps, [.off, .off, .off, .off, .off, .off, .off, .off, .off, .off, .off])
        XCTAssertEqual(oneMinuteLamps, [.off, .off,.off, .off])
        XCTAssertTrue(isSecondsLampIluminated)
        
        updateViewModel(for: DateComponents(hour: 13, minute: 31, second: 59))
        let newFiveHourLamps =  viewModel.fiveHourLamps
        let newOneHourLamps =  viewModel.oneHourLamps
        let newFiveMinuteLamps =  viewModel.fiveMinuteLamps
        let newOneMinuteLamps =  viewModel.oneMinuteLamps
        let newIsSecondsLampIlluminated =  viewModel.isSecondsLampIluminated
        
        XCTAssertEqual(newFiveHourLamps, [.red, .red, .off, .off])
        XCTAssertEqual(newOneHourLamps, [.red, .red, .red, .off])
        XCTAssertEqual(newFiveMinuteLamps, [.yellow, .yellow, .red, .yellow, .yellow, .red, .off, .off, .off, .off, .off])
        XCTAssertEqual(newOneMinuteLamps, [.yellow, .off,.off, .off])
        XCTAssertFalse(newIsSecondsLampIlluminated)
    }
    
    // MARK: - DateFormatter
    
    func test_formattedTime_returns_the_correct_time_format() {
        let dateComponents = DateComponents(year: 2026,
                                            month: 0,
                                            day: 13,
                                            hour: 9,
                                            minute: 58,
                                            second: 3)
        let date = Calendar.current.date(from: dateComponents)!
        
        viewModel.update(with: date)
        
        XCTAssertEqual(viewModel.digitalTime, "09:58")
    }
}
