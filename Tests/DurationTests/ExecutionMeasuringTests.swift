//
//  ExecutionMeasuringTests.swift
//  Duration
//
//  Created by Robert Andrzejczyk on 03/03/2023.
//

import XCTest
@testable import Duration

final class MeasuringExecutionTests: XCTestCase {

    func test_measuring_duration_of_synchronous_code_execution() throws {
        let duration = Duration.measure {
            Thread.sleep(forTimeInterval: 10.milliseconds.inSeconds)
        }
        XCTAssertTrue(duration.inMilliseconds >= 10)
    }
    
    func test_measuring_duration_of_throwing_synchronous_code_execution() throws {
        @discardableResult func getValue() throws -> Int { 0 }
        
        let duration = try Duration.measure {
            Thread.sleep(forTimeInterval: 10.milliseconds.inSeconds)
            try getValue()
        }
        XCTAssertTrue(duration.inMilliseconds >= 10)
    }
    
    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    func test_measuring_duration_of_throwing_asynchronous_code_execution() async throws {
        let duration = try await Duration.measure {
            try await Task.sleep(for: 10.milliseconds)
        }
        XCTAssertTrue(duration.inMilliseconds >= 10)
    }

    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    func test_measuring_duration_of_asynchronous_code_execution() async throws {
        let duration = await Duration.measure {
            try? await Task.sleep(for: 10.milliseconds)
        }
        XCTAssertTrue(duration.inMilliseconds >= 10)
    }
}
