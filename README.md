# ULIDSwift

ULID (Universally Unique Lexicographically Sortable Identifier) generator for swift

Based on [alizain/ulid](https://github.com/alizain/ulid) for a more detailed ULID specification.

## Usage

### Swift Package Manager

You can use this library via `spm` too. Just update your `Package.swift` to include this library as a debendency.

An example follows below.

```swift
// swift-tools-version:4.2

import PackageDescription

let package = Package(
    name: "Your App",
    dependencies: [
        .package(url: "https://github.com/simonwhitehouse/ULIDSwift.git", from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "Your App",
            dependencies: ["ULIDSwift"]),
    ]
)
```

### Examples

ULID generation examples:

```swift
let a = String.generateULID(timeStamp: nil)
let b = String.generateULID(timeStamp: nil)
let x = ULID.generateULID()
let y = ULID.generateULID(timeStamp: 1469918176385)
let ulid = ULID(timeStamp: nil)
let ulidTime = ulid.t
let ulidRandom = ulid.r
```

Not the best solution in the world so feel free to submit pull request to improve
