# Duration

[![](https://img.shields.io/static/v1?label=Swift%20Compatibility&message=5.7%20|%205.6%20|%205.5&color=blue)]() [![](https://img.shields.io/static/v1?label=Platform%20Compatibility&message=iOS%20|%20macOS%20|%20tvOS%20|%20watchOS&color=blue)]()

[![Tests](https://github.com/rojarand/swift-duration/actions/workflows/tests.yml/badge.svg)](https://github.com/rojarand/swift-duration/actions/workflows/tests.yml)

**Duration** is a `Swift` library. The library **simplifies** dealing with time intervals, given in various time units and variable types.

## Usage example

Instead of creating hard to read and use functions like this:

```swift
func execute(after intervalInMilliseconds: UInt, action: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(intervalInMilliseconds*10000000)) {
        action()
    }
}
...
/*
a few lines later ...

(-_-)ゞ

Does the "execute" method expect microseconds or milliseconds? ... This is the question 
*/
execute(after: 500) {
    //action
}
```
, the implementation can be simplified to the following form:

```swift
import Duration

func execute(after duration: Duration, action: @escaping () -> Void) {
    DispatchQueue.main.async(after: duration) {
        action()
    }
}
...
execute(after: 500.milliseconds) {
    //action
}
```

There is a bug in the first snippet. Did you notice that?

## Features

### Easy declaration
```swift
let breakDuration = 15.minutes
//or
let breakDuration: Duration = .minutes(15)
//or
let breakDuration = Duration.minutes(15)

let twoAndHalfDays = 2.5.days
//or
let twoAndHalfDays: Duration = .days(2.5)
//or
let twoAndHalfDays = Duration.days(2.5)
```

### Arithmetic operations
```swift
//Addition
let duration = 1.seconds + 500.milliseconds
...
//Subtraction
let duration = 1.seconds - 500.milliseconds
...
//Multiplication
let duration = Duration.milliseconds(500) * 10
...
//Division
let duration = Duration.milliseconds(500) / 2.0
...
//Combined
let duration = (500.milliseconds + 1.seconds) * 2 - 100.milliseconds
...
//Mutating
var duration = Duration.milliseconds(500)
duration += 100.milliseconds
duration -= 99.milliseconds
```

### Comparision

```swift
Duration.milliseconds(1000) == Duration.seconds(1)
1.seconds >= 999.milliseconds
```

### Execution time measurement

```swift
let (duration, result) = Duration.measure {
    compute()
}
```
Supports throwing and async/await blocks.

```swift
let (duration, result) = try Duration.measure {
    try compute()
}

let (duration, result) = try await Duration.measure {
    try await compute()
}
```

### Wide range of supported units: 
- days, 
- hours, 
- minutes, 
- seconds, 
- milliseconds, 
- microseconds, 
- nanoseconds

### GCD

```swift
DispatchQueue.main.async(after: 10.milliseconds) {
    action()
}
```

### Concurrency/Task

```swift
try await Task.sleep(for: 10.milliseconds)
```

## Installation

**Duration** is officially available *only* via Swift Package Manager.

In Xcode 11 or greater, in you project, select: `File > Add Packages...`

In the search bar paste

```
https://github.com/rojarand/swift-duration
``` 

Then proceed with installation.

For command-line based apps, you can just add this directly to your **Package.swift** file:

```swift
dependencies: [
    .package(url: "https://github.com/rojarand/swift-duration", from: "1.0.0"),
]
```

Check the latest version in the *Releases* section.

Once installed, import the library to a file where you want to use it:
```swift
import Duration
```

## License
MIT © [Robert Andrzejczyk](https://github.com/rojarand)

## Contribute
Contributions are always welcome!

