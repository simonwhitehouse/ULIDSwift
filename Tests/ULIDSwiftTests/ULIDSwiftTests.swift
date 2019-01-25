import XCTest
@testable import ULIDSwift

final class ULIDSwiftTests: XCTestCase {
    func length() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(String.generateULID().count, 26)
    }

    static var allTests = [
        ("ULIDlength", length),
    ]
}
