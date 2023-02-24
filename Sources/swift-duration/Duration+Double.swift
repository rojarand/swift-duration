//
//  Duration+Double.swift
//  swift-duration
//
//  Created by Robert Andrzejczyk on 23/02/2023.
//

import Foundation

extension Double {
    
    public var seconds: Duration {
        Duration.seconds(self)
    }
    
    public var milliseconds: Duration {
        Duration.milliseconds(self)
    }
}
