//
//  Int+Duration.swift
//  Duration
//
//  Created by Robert Andrzejczyk on 24/02/2023.
//
import Duration

extension Int {
    
    public var seconds: Duration {
        Duration.seconds(self)
    }
    
    public var milliseconds: Duration {
        Duration.milliseconds(self)
    }
}
