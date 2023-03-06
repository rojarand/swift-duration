import XCTest
@testable import Duration

final class DurationTests: XCTestCase {
    
    func test_duration_is_addable() throws {
        var duration = Duration.seconds(1)
        duration += .milliseconds(50)
        XCTAssertEqual(duration.inMilliseconds, 1050.0)
    }
    
    func test_durations_can_be_added() throws {
        let duration = Duration.seconds(1) + Duration.nanoseconds(1)
        XCTAssertEqual(duration.inNanoseconds, 1000_000_001.0, accuracy: Duration.nano)
    }
    
    func test_seconds_converts_to_milliseconds() throws {
        XCTAssertEqual(Duration.seconds(2).inMilliseconds, 2000.0)
    }
    
    func test_hours_converts_to_seconds() throws {
        XCTAssertEqual(Duration.hours(2).inSeconds, 7200.0)
    }
}

final class DurationSubtractionTests: XCTestCase {
    
    func test_duration_is_subtractable() throws {
        var duration = Duration.seconds(1)
        duration -= Duration.milliseconds(50)
        XCTAssertEqual(duration.inMilliseconds, 950.0, accuracy: Duration.nano)
    }
    
    func test_subtraction_of_duration_produces_expected_value() throws {
        let duration: Duration = .seconds(1) - .milliseconds(300)
        XCTAssertEqual(duration.inMilliseconds, 700.0, accuracy: Duration.nano)
    }
    
}

final class DurationMultiplicationTests: XCTestCase {
    
    func test_duration_multiplies_by_integer() throws {
        let duration = Duration.seconds(1) * 2
        XCTAssertEqual(duration.inSeconds, 2.0)
    }
    
    func test_duration_multiplies_by_double() throws {
        let duration = Duration.seconds(1) * 2.0
        XCTAssertEqual(duration.inSeconds, 2.0)
    }
}

final class DurationDivisionTests: XCTestCase {
    
    func test_duration_divides_by_integer() throws {
        let duration = Duration.milliseconds(500) / 2
        XCTAssertEqual(duration.inMilliseconds, 250.0)
    }
    
    func test_duration_dividies_by_double() throws {
        let duration = Duration.milliseconds(500) / 2.0
        XCTAssertEqual(duration.inMilliseconds, 250.0)
    }
}

final class DurationComparisionTests: XCTestCase {
    
    func test_durations_are_equal() throws {
        XCTAssertEqual(Duration.milliseconds(1000), Duration.seconds(1))
    }
    
    func test_duration_is_shorter() throws {
        XCTAssertTrue(Duration.milliseconds(500) < Duration.seconds(1))
    }
    
    func test_duration_is_shorter_or_equal() throws {
        XCTAssertTrue(Duration.milliseconds(500) <= Duration.milliseconds(500))
    }
    
    func test_duration_is_longer() throws {
        XCTAssertTrue(Duration.seconds(1) > Duration.milliseconds(500))
    }
    
    func test_duration_is_longer_or_equal() throws {
        XCTAssertTrue(Duration.seconds(1) >= Duration.milliseconds(500))
    }
}
