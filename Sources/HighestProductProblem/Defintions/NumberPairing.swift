//
//  NumberPairing.swift
//  HighestProductProblem
//
//  Created by Justin Reusch on 1/9/19.
//  Copyright © 2019 Justin Reusch. All rights reserved.
//

import Foundation

/**
 * A structure that stores two numbers that sum to a given amount.
 * Finds the product, the difference and the result of muliplying the difference and the product.
 */
struct NumberPairing: Equatable, Comparable, Hashable {
    private var storedNumber: Double
    let sumOfNumbers: Double
    var firstNumber: Double {
        get {
            return storedNumber
        }
        set {
            storedNumber = validateAndCorrectNumberInput(of: newValue)
        }
    }
    var secondNumber: Double {
        get {
             return sumOfNumbers - storedNumber
        }
        set {
            storedNumber = sumOfNumbers - validateAndCorrectNumberInput(of: newValue)
        }
    }
    var product: Double {
        return storedNumber * secondNumber
    }
    var difference: Double {
        return abs(storedNumber - secondNumber)
    }
    var result: Double {
        return product * difference
    }
    
    var hash: Double {
        return storedNumber + sumOfNumbers + result
    }
    
    // Initializers ---------------------------------------------------------- /
    
    init(oneNumberIs oneNumber: Double, addingUpTo sumOfNumbers: Double) {
        self.storedNumber = oneNumber
        self.sumOfNumbers = sumOfNumbers
        self.storedNumber = validateAndCorrectNumberInput(of: oneNumber)
    }
    init(oneNumberIs oneNumber: Double) {
        self.init(oneNumberIs: oneNumber, addingUpTo: defaultSum)
    }
    
    // Methods --------------------------------------------------------------- /
    
    // Creates a long report with both numbers, the product, difference and the result
    func longReport() -> String {
        let firstRounded = roundNumberToString(from: firstNumber, withPrecision: 100_000)
        let secondRounded = roundNumberToString(from: secondNumber, withPrecision: 100_000)
        let productRounded = roundNumberToString(from: product, withPrecision: 100_000)
        let differnceRounded = roundNumberToString(from: difference, withPrecision: 100_000)
        let resultRounded = roundNumberToString(from: result, withPrecision: 100_000)
        return """
            Numbers: \(firstRounded) and \(secondRounded)
            \(lineMedium)
            Product: \(productRounded)
            Difference: \(differnceRounded)
            \(lineMedium)
            Result: \(resultRounded)\n
            """
    }
    
    // Creates a short report with both numbers and the result
    func shortReport() -> String {
        let firstRounded = roundNumberToString(from: firstNumber, withPrecision: 100_000)
        let secondRounded = roundNumberToString(from: secondNumber, withPrecision: 100_000)
        let resultRounded = roundNumberToString(from: result, withPrecision: 100_000)
        return "\(firstRounded) and \(secondRounded) -> \(resultRounded)"
    }
    
    // Private Methods ------------------------------------------------------- /
    
    // This will set a bound to ensures that the number is positive and not more than the sum
    private func validateAndCorrectNumberInput(of userInput: Double) -> Double {
        let nonNegative = abs(userInput)
        return nonNegative > sumOfNumbers ? sumOfNumbers : nonNegative
    }
    
    // Static Methods -------------------------------------------------------- /
    
    // Method for checking equality
    static func == (lhs: NumberPairing, rhs: NumberPairing) -> Bool {
        return lhs.storedNumber == rhs.storedNumber && lhs.sumOfNumbers == rhs.sumOfNumbers
    }
    
    // Method for checking non-equality
    static func != (lhs: NumberPairing, rhs: NumberPairing) -> Bool {
        return lhs.storedNumber != rhs.storedNumber || lhs.sumOfNumbers != rhs.sumOfNumbers
    }
    
    // Method for comarison
    static func < (lhs: NumberPairing, rhs: NumberPairing) -> Bool {
        return lhs.result < rhs.result
    }
    
}
