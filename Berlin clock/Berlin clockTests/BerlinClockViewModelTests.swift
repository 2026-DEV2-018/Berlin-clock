//
//  BerlinClockViewModelTests.swift
//  Berlin clockTests
//
//  Created by 2026-DEV2-018 on 16/01/2026.
//

import XCTest
@testable import Berlin_clock

final class BerlinClockViewModelTests: XCTestCase {

    func test_update_passes_correct_time_values_to_berlin_clock() async {
        let clock = await BerlinClock()
        let viewModel = await BerlinClockViewModel(clock: clock)
        
        let dateConponents = DateComponents(hour: 9, minute: 0, second: 0)
        let date = Calendar.current.date(from: dateConponents)!
        
        await viewModel.update(with: date)
        
        let isSecondsLampIluminated = await viewModel.isSecondsLampIluminated
        XCTAssertTrue(isSecondsLampIluminated)
    }

}
