//
//  Int+Duration.swift
//  Duration
//
//  Created by Robert Andrzejczyk on 24/02/2023.
//

extension Int {
    
    public var hours: Duration {
        .hours(self)
    }
    
    public var minutes: Duration {
        .minutes(self)
    }
    
    public var seconds: Duration {
        .seconds(self)
    }
    
    public var milliseconds: Duration {
        .milliseconds(self)
    }
    
    public var microseconds: Duration {
        .microseconds(self)
    }
    
    public var nanoseconds: Duration {
        .nanoseconds(self)
    }
}
