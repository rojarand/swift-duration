//
//  Duration+Int.swift
//  DurationTests
//
//  Created by Robert Andrzejczyk on 23/02/2023.
//

import XCTest
@testable import Duration

final class Duration_Int: XCTestCase {

    func test_creates_duration_from_integer() throws {
        XCTAssertEqual(Duration.milliseconds(999), 999.milliseconds)
    }
}
