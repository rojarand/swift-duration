import Foundation

public struct Duration {
    
    private var timeInterval: TimeInterval

    init(timeInterval: TimeInterval) {
        self.timeInterval = timeInterval
    }
}

extension Duration: Comparable {
    
    public static func < (lhs: Self, rhs: Self) -> Bool {
        lhs.timeInterval < rhs.timeInterval
    }
}

extension Duration {
    
    public static func + (lhs: Self, rhs: Self) -> Self {
        .seconds(lhs.timeInterval + rhs.timeInterval)
    }
    
    public static func += (lhs: inout Self, rhs: Self) {
        lhs.timeInterval += rhs.timeInterval
    }
}

extension Duration {
    public static func - (lhs: Self, rhs: Self) -> Self {
        .seconds(lhs.timeInterval - rhs.timeInterval)
    }
    
    public static func -= (lhs: inout Self, rhs: Self) {
        lhs.timeInterval -= rhs.timeInterval
    }
}

extension Duration {
    public static func * (lhs: Self, rhs: Double) -> Self {
        .seconds(lhs.timeInterval * rhs)
    }
    
    public static func * (lhs: Self, rhs: Int) -> Self {
        .seconds(lhs.timeInterval * TimeInterval(rhs))
    }
}

extension Duration {
    public static func / (lhs: Self, rhs: Double) -> Self {
        .seconds(lhs.timeInterval / rhs)
    }
    
    public static func / (lhs: Self, rhs: Int) -> Self {
        .seconds(lhs.timeInterval / TimeInterval(rhs))
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
    
    public static func days(_ amount: Double) -> Duration {
        Duration(timeInterval: amount * Self.day)
    }
    
    public static func days(_ amount: Int) -> Duration {
        Duration(timeInterval: Double(amount) * Self.day)
    }
    
    public static func hours(_ amount: Double) -> Duration {
        Duration(timeInterval: amount * Self.hour)
    }
    
    public static func hours(_ amount: Int) -> Duration {
        Duration(timeInterval: Double(amount) * Self.hour)
    }
    
    public static func minutes(_ amount: Double) -> Duration {
        Duration(timeInterval: amount * Self.minute)
    }
    
    public static func minutes(_ amount: Int) -> Duration {
        Duration(timeInterval: Double(amount) * Self.minute)
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
    
    public static func microseconds(_ amount: Int) -> Duration {
        Duration(timeInterval: Double(amount) * Self.micro)
    }
    
    public static func nanoseconds(_ amount: Double) -> Duration {
        Duration(timeInterval: amount * Self.nano)
    }
    
    public static func nanoseconds(_ amount: Int) -> Duration {
        Duration(timeInterval: Double(amount) * Self.nano)
    }
    
    public var isPositive: Bool {
        timeInterval > 0
    }
    
    public var isNegative: Bool {
        timeInterval < 0
    }
    
    public var isZero: Bool {
        timeInterval == 0.0
    }
}


