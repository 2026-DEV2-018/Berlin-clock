//
//  BerlinClockViewModelTests.swift
//  Berlin clockTests
//
//  Created by 2026-DEV2-018 on 16/01/2026.
//

import XCTest
@testable import Berlin_clock

final class BerlinClockViewModelTests: XCTestCase {

    func test_update_with_even_seconds_sets_seconds_lamps_on() async {
        let clock = await BerlinClock()
        let viewModel = await BerlinClockViewModel(clock: clock)
        
        let dateConponents = DateComponents(hour: 9, minute: 0, second: 0)
        let date = Calendar.current.date(from: dateConponents)!
        
        await viewModel.update(with: date)
        
        let isSecondsLampIluminated = await viewModel.isSecondsLampIluminated
        XCTAssertTrue(isSecondsLampIluminated)
    }
    
    func test_update_sets_five_hour_lamps_for_date_with_correct_number_of_lamps() async {
        let clock = await BerlinClock()
        let viewModel = await BerlinClockViewModel(clock: clock)
        
        let dateConponents = DateComponents(hour: 9, minute: 0, second: 0)
        let date = Calendar.current.date(from: dateConponents)!
        
        await viewModel.update(with: date)
        
        let fiveHourLamps = await viewModel.fiveHourLamps
        
        
        XCTAssertEqual(fiveHourLamps.count, 4)
    }

}
