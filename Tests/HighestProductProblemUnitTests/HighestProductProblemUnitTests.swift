//
//  HigestProductProblemUnitTests.swift
//  HigestProductProblemUnitTests
//
//  Created by Justin Reusch on 1/25/19.
//  Copyright © 2019 Justin Reusch. All rights reserved.
//

@testable import HighestProductProblem
import XCTest

let largeProblemSize: Double = 900
let massiveProblemSize: Double = 9_000_000

class HighestProductProblemUnitTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func printWithOtherResults(size: Double = 8) -> NumberPairingProblem {
        let testProblem = NumberPairingProblem(addingUpTo: size)
        testProblem.printAllResults()
        return testProblem
    }

    func printWithoutOtherResults(size: Double = 8) -> NumberPairingProblem {
        let testProblem = NumberPairingProblem(addingUpTo: size, withOtherResults: false)
        testProblem.printAllResults()
        return testProblem
    }

    func testResultForEightIsCorrect() {
        let testProblem = NumberPairingProblem(addingUpTo: 8, withOtherResults: true)
        let bestResult = testProblem.bestResult
        let expectedResult = 49.26722297
        let marginOfError = 0.00000001
        let difference = abs(bestResult - expectedResult)
        let testAssumption = difference < marginOfError
        XCTAssert(testAssumption, "Test failed because difference was expected to be below \(marginOfError) and was \(difference)")
    }

    func testThatRunCountIsUnderFourty() {
        let maxRunCount = 40
        let problem = self.printWithOtherResults(size: massiveProblemSize)
        let runs = problem.runsToSolve
        let testAssumption = runs < maxRunCount
        XCTAssert(testAssumption, "Run count was \(runs), which is not less than the maximum runs allowed.")
    }

    func testPerformanceOfStandardProblem() {
        self.measure {
            let _ = self.testResultForEightIsCorrect()
        }
    }

    func testPerformanceOfStandardProblemWithOtherResults() {
        self.measure {
            let _ = self.printWithOtherResults()
        }
    }

    func testPerformanceOfLargeProblemWithOtherResults() {
        self.measure {
            let _ = self.printWithOtherResults(size: largeProblemSize)
        }
    }

    func testPerformanceOfLargeProblemWithoutOtherResults() {
        self.measure {
            let _ = self.printWithoutOtherResults(size: largeProblemSize)
        }
    }

    func testPerformanceOfMassiveProblemWithOtherResults() {
        self.measure {
            let _ = self.printWithOtherResults(size: massiveProblemSize)
        }
    }

    func testPerformanceOfMassiveProblemWithoutOtherResults() {
        self.measure {
            let _ = self.printWithoutOtherResults(size: massiveProblemSize)
        }
    }

    static var allTests = [
        ("testResultForEightIsCorrect", testResultForEightIsCorrect),
        ("testThatRunCountIsUnderFourty", testThatRunCountIsUnderFourty)
    ]

}
