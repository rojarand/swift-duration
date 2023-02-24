//
//  DUration+DispatchQueue.swift
//  swift-duration
//
//  Created by Robert Andrzejczyk on 23/02/2023.
//

import Foundation

extension DispatchQueue {
    
    public func asyncAfter(duration: Duration,
                           qos: DispatchQoS = .unspecified,
                           flags: DispatchWorkItemFlags = [],
                           execute work: @escaping @convention(block) () -> Void) {
        asyncAfter(deadline: .now() + duration.inSeconds, qos: qos, flags: flags, execute: work)
    }
}
