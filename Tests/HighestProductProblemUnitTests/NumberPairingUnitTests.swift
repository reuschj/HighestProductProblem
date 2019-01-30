//
//  NumberPairingUnitTests.swift
//  HigestProductProblemUnitTests
//
//  Created by Justin Reusch on 1/26/19.
//  Copyright © 2019 Justin Reusch. All rights reserved.
//

@testable import HighestProductProblem
import XCTest

class NumberPairingUnitTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testThatNumberPairingEqualityWorks() {
        let twoAddsUpToEight = NumberPairing(oneNumberIs: 2, addingUpTo: 8)
        let twoAlsoAddsUpToEight = NumberPairing(oneNumberIs: 2, addingUpTo: 8)
        let sixAddsUpToEight = NumberPairing(oneNumberIs: 6, addingUpTo: 8)
        let threeAddsUpToEight = NumberPairing(oneNumberIs: 3, addingUpTo: 8)
        let threeAddsUpToTen = NumberPairing(oneNumberIs: 3, addingUpTo: 10)
        XCTAssert(twoAddsUpToEight == twoAlsoAddsUpToEight)
        XCTAssert(twoAddsUpToEight == sixAddsUpToEight)
        XCTAssert(threeAddsUpToEight != sixAddsUpToEight)
        XCTAssert(threeAddsUpToEight != threeAddsUpToTen)
    }

    func testThatComparisonWorks() {
        let twoAddsUpToEight = NumberPairing(oneNumberIs: 2, addingUpTo: 8)
        let sixAddsUpToEight = NumberPairing(oneNumberIs: 6, addingUpTo: 8)
        let threeAddsUpToEight = NumberPairing(oneNumberIs: 3, addingUpTo: 8)
        XCTAssert(twoAddsUpToEight >= sixAddsUpToEight, "\(twoAddsUpToEight) should be greater than or equal to (it's equal) \(sixAddsUpToEight)")
        XCTAssert(threeAddsUpToEight < sixAddsUpToEight, "\(threeAddsUpToEight) should be less than \(sixAddsUpToEight)")
        XCTAssert(sixAddsUpToEight > threeAddsUpToEight, "\(sixAddsUpToEight) should be greater than \(threeAddsUpToEight)")
    }

    func testPerformanceOfCreation() {
        // This is an example of a performance test case.
        self.measure {
            let _ = NumberPairing(oneNumberIs: 2, addingUpTo: 8)
        }
    }

    static var allTests = [
        ("testThatNumberPairingEqualityWorks", testThatNumberPairingEqualityWorks),
        ("testThatComparisonWorks", testThatComparisonWorks),
        ("testPerformanceOfCreation", testPerformanceOfCreation)
    ]

}
