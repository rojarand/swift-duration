//
//  Duration+Task.swift
//  swift-duration
//
//  Created by Robert Andrzejczyk on 23/02/2023.
//

import Foundation

@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
extension Task where Success == Never, Failure == Never {

    public static func sleep(duration: Duration) async throws {
        try await sleep(nanoseconds: UInt64(duration.inNanoseconds))
    }
}
