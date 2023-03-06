//
//  Duration+Double.swift
//  Duration
//
//  Created by Robert Andrzejczyk on 23/02/2023.
//

extension Double {
    
    public var days: Duration {
        .days(self)
    }
    
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
