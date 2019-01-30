import XCTest

#if !os(macOS)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(HighestProductProblemUnitTests.allTests),
        testCase(NumberPairingUnitTests.allTests)
    ]
}
#endif
