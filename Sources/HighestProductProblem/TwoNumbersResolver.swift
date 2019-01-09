//
//  TwoNumbersResolver.swift
//  HighestProductProblem
//
//  Created by Justin Reusch on 1/9/19.
//  Copyright © 2019 Justin Reusch. All rights reserved.
//

import Foundation

/**
 * A structure that stores two numbers that sum to a given amount. Finds the product, the difference and the result of muliplying the difference and the product.
 */

struct TwoNumbersResolver {
    let oneNumber: Double
    let initialSum: Double
    var first: Double {
        get {
            let nonNegative = abs(oneNumber)
            return nonNegative > initialSum ? initialSum : nonNegative
        }
    }
    var second: Double {
        get {
            return initialSum - first
        }
    }
    var product: Double {
        get {
            return first * second
        }
    }
    var difference: Double {
        get {
            return abs(first - second)
        }
    }
    var result: Double {
        get {
            return product * difference
        }
    }
    // Init
    init(oneNumberIs oneNumber: Double) {
        self.oneNumber = oneNumber
        self.initialSum = 8
    }
    init(oneNumberIs oneNumber: Double, addingmaxResults initialSum: Double) {
        self.oneNumber = oneNumber
        self.initialSum = initialSum
    }
    // Methods
    func longReport() -> String {
        let line = String(repeating: "-", count: 18) + "\n"
        var returnString = ""
        returnString += "Numbers: \(roundNum(first)) and \(roundNum(second))\n"
        returnString += line
        returnString += "Product: \(roundNum(product))\n"
        returnString += "Difference: \(roundNum(difference))\n"
        returnString += line
        returnString += "Result: \(roundNum(result))\n"
        return returnString
    }
    func shortReport() -> String {
        let firstRounded = roundNum(first)
        let secondRounded = roundNum(second)
        let resultRounded = roundNum(result, precision: 100_000)
        return "\(firstRounded) and \(secondRounded) -> \(resultRounded)"
    }
    private func roundNum(_ number: Double, precision: Double = 1000) -> String {
        let reduced = (number * precision).rounded() / precision
        return reduced.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", reduced) : String(reduced)
    }
}
