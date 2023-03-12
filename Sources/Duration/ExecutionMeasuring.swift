//
//  ExecutionMeasuringTests.swift
//  Duration
//
//  Created by Robert Andrzejczyk on 03/03/2023.
//

import Foundation

extension Duration {
    
    public static func measure<T>(durationOf action: () throws -> T)
    rethrows -> (duration: Duration, result: T) {
        let startTime = timestamp()
        let result = try action()
        let endTime = timestamp()
        return (duration: .seconds(endTime-startTime), result: result)
    }
    
    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    public static func measure<T>(durationOf action: () async throws -> T)
    async rethrows -> (duration: Duration, result: T) {
        let startTime = timestamp()
        let result = try await action()
        let endTime = timestamp()
        return (duration: .seconds(endTime-startTime), result: result)
    }
    
    @inline(__always) static func timestamp() -> TimeInterval {
        ProcessInfo.processInfo.systemUptime
    }
}
