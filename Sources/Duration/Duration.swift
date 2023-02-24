import Foundation

public struct Duration {
    
    private var timeInterval: TimeInterval

    init(timeInterval: TimeInterval) {
        self.timeInterval = timeInterval
    }
}

extension Duration: Equatable {}

extension Duration {
    
    static func + (lhs: Self, rhs: Self) -> Self {
        Duration.seconds(lhs.timeInterval + rhs.timeInterval)
    }
    
    static func += (lhs: inout Self, rhs: Self) {
        lhs.timeInterval += rhs.timeInterval
    }
}

extension Duration {
    
    static let day = 24 * hour
    static let hour = 60.0 * minute
    static let minute = 60.0
    
    static let milli = 0.001
    static let micro = 0.000_001
    static let nano = 0.000_000_001
    
    public var inDays: Double {
        timeInterval / Self.day
    }
    
    public var inHours: Double {
        timeInterval / Self.hour
    }
    
    public var inMinutes: Double {
        timeInterval / Self.minute
    }
    
    public var inSeconds: Double {
        timeInterval
    }
    
    public var inMilliseconds: Double {
        timeInterval / Self.milli
    }
    
    public var inMicroseconds: Double {
        timeInterval / Self.micro
    }
    
    public var inNanoseconds: Double {
        timeInterval / Self.nano
    }
    
    public static func hours(_ amount: Double) -> Duration {
        Duration(timeInterval: amount * Self.hour)
    }
    
    public static func minutes(_ amount: Double) -> Duration {
        Duration(timeInterval: amount * Self.minute)
    }
    
    public static func seconds(_ amount: Double) -> Duration {
        Duration(timeInterval: amount)
    }
    
    public static func seconds(_ amount: Int) -> Duration {
        Duration.seconds(Double(amount))
    }
    
    public static func milliseconds(_ amount: Double) -> Duration {
        Duration(timeInterval: amount * Self.milli)
    }
    
    public static func milliseconds(_ amount: Int) -> Duration {
        Duration.milliseconds(Double(amount))
    }
    
    public static func microseconds(_ amount: Double) -> Duration {
        Duration(timeInterval: amount * Self.micro)
    }
    
    public static func nanoseconds(_ amount: Double) -> Duration {
        Duration(timeInterval: amount * Self.nano)
    }
}


