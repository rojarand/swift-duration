//
//  ExecutionMeasuringTests.swift
//  Duration
//
//  Created by Robert Andrzejczyk on 03/03/2023.
//

import Foundation

extension Duration {
    
    @inline(__always)
    public static func measure<T>(durationOf action: () throws -> T)
    throws -> (duration: Duration, result: T) {
        let startTime = timestamp()
        let result = try action()
        let endTime = timestamp()
        return (duration: .seconds(endTime-startTime), result: result)
    }
    
    @inline(__always)
    public static func measure<T>(durationOf action: () -> T) ->
    (duration: Duration, result: T) {
        let startTime = timestamp()
        let result = action()
        let endTime = timestamp()
        return (duration: .seconds(endTime-startTime), result: result)
    }
    
    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inline(__always)
    public static func measure<T>(durationOf action: () async throws -> T)
    async throws -> (duration: Duration, result: T) {
        let startTime = timestamp()
        let result = try await action()
        let endTime = timestamp()
        return (duration: .seconds(endTime-startTime), result: result)
    }
    
    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inline(__always)
    public static func measure<T>(durationOf action: () async -> T)
    async -> (duration: Duration, result: T) {
        let startTime = timestamp()
        let result = await action()
        let endTime = timestamp()
        return (duration: .seconds(endTime-startTime), result: result)
    }
    
    @inline(__always) static func timestamp() -> TimeInterval {
        ProcessInfo.processInfo.systemUptime
    }
}
