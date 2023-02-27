//
//  Duration+Double.swift
//  Duration
//
//  Created by Robert Andrzejczyk on 23/02/2023.
//

extension Double {
    
    public var seconds: Duration {
        Duration.seconds(self)
    }
    
    public var milliseconds: Duration {
        Duration.milliseconds(self)
    }
}
