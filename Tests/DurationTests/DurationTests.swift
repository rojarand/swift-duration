import XCTest
@testable import Duration

final class DurationTests: XCTestCase {
    
    func test_duration_is_addable() throws {
        var duration = Duration.seconds(1)
        duration += Duration.milliseconds(50)
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
    
    /*
    DispatchQueue.main.asyncAfter(duration: .milliseconds(1)) {
            print(Date())
        }
    */
    
}
