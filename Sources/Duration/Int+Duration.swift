//
//  Int+Duration.swift
//  Duration
//
//  Created by Robert Andrzejczyk on 24/02/2023.
//

extension Int {
    
    public var seconds: Duration {
        .seconds(self)
    }
    
    public var milliseconds: Duration {
        .milliseconds(self)
    }
}
