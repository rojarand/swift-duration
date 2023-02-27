//
//  DUration+DispatchQueue.swift
//  Duration
//
//  Created by Robert Andrzejczyk on 23/02/2023.
//

import Foundation

extension DispatchQueue {
    
    public func async(after duration: Duration,
                      qos: DispatchQoS = .unspecified,
                      flags: DispatchWorkItemFlags = [],
                      execute work: @escaping @convention(block) () -> Void) {
        asyncAfter(deadline: .now() + duration.inSeconds, qos: qos, flags: flags, execute: work)
    }
    
    public func async(after duration: Duration, execute: DispatchWorkItem) {
        asyncAfter(deadline: .now() + duration.inSeconds, execute: execute)
    }
}
