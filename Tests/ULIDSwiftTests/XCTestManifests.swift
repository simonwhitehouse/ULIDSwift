import XCTest

#if !os(macOS)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(ULIDSwiftTests.allTests),
    ]
}
#endif