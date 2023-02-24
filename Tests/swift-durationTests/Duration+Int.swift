//
//  Duration+Int.swift
//  swift-durationTests
//
//  Created by Robert Andrzejczyk on 23/02/2023.
//

import XCTest
@testable import swift_duration

final class Duration_Int: XCTestCase {

    func test_creates_duration_from_integer() throws {
        XCTAssertEqual(Duration.milliseconds(999), 999.milliseconds)
    }
}
