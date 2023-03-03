//
//  ExecutionMeasuringTests.swift
//  Duration
//
//  Created by Robert Andrzejczyk on 03/03/2023.
//

import Foundation

extension Duration {
    
    @inline(__always)
    public static func measure(excutionDurationOf action: () throws -> Void) throws -> Duration {
        let startTime = timestamp()
        try action()
        let endTime = timestamp()
        return .seconds(endTime-startTime)
    }
    
    @inline(__always)
    public static func measure(excutionDurationOf action: () -> Void) -> Duration {
        let startTime = timestamp()
        action()
        let endTime = timestamp()
        return .seconds(endTime-startTime)
    }
    
    
    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inline(__always)
    public static func measure(excutionDurationOf action: () async throws -> Void) async throws -> Duration {
        let startTime = timestamp()
        try await action()
        let endTime = timestamp()
        return .seconds(endTime-startTime)
    }
    
    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @inline(__always)
    public static func measure(excutionDurationOf action: () async -> Void) async -> Duration {
        let startTime = timestamp()
        await action()
        let endTime = timestamp()
        return .seconds(endTime-startTime)
    }
    
    @inline(__always) static func timestamp() -> TimeInterval {
        ProcessInfo.processInfo.systemUptime
    }
}
