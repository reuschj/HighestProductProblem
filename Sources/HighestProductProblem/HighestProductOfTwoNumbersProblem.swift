//
//  HighestProductOfTwoNumbersProblem.swift
//  HighestProductProblem
//
//  Created by Justin Reusch on 1/9/19.
//  Copyright © 2019 Justin Reusch. All rights reserved.
//

import Foundation

/**
  A class to define a problem by which takes two numbers that sum to a given amount (default to 8). The problem must find the largest number combination (determined by multiplying the difference by the product of the two numbers)
 */
class HighestProductOfTwoNumbersProblem {
    let initialSum: Double
    let precision: Double
    private let line = String(repeating: "-", count: 18)
    var introString: String {
        get {
            return "Problem:\nFind two numbers that add up to \(roundNum(initialSum)), such that the product multiplied by the difference produces the largest possible value.\n"
        }
    }
    private var searchRange: StrideTo<Double> {
        get {
            return stride(from: 0.0, to: initialSum / 2 + precision, by: precision)
        }
    }
    private func roundNum(_ number: Double, precision: Double = 1000) -> String {
        let reduced = (number * precision).rounded() / precision
        return reduced.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", reduced) : String(reduced)
    }
    private var results: (Double, [NumberPairing], [NumberPairing])?
    
    // Initializers ---------------------------------------------------------- /
    
    init(addingmaxResults initialSum: Double, withPrecision precision: Double) {
        self.initialSum = initialSum
        self.precision = precision
        self.results = self.getResults()
    }
    convenience init() {
        self.init(addingmaxResults: 8, withPrecision: 0.1)
    }
    convenience init(addingmaxResults initialSum: Double) {
        self.init(addingmaxResults: initialSum, withPrecision: 0.1)
    }
    
    // Methods --------------------------------------------------------------- /
    
    private func getResults() -> (Double, [NumberPairing], [NumberPairing]) {
        var bestResult: Double = 0
        var winnerList: Array<NumberPairing> = []
        var otherList: Array<NumberPairing> = []
        for number in searchRange {
            let thisResult = NumberPairing(oneNumberIs: number, addingUpTo: initialSum)
            if thisResult.result > bestResult {
                bestResult = thisResult.result
                winnerList.removeAll()
                winnerList.append(thisResult)
            } else if thisResult.result == bestResult {
                winnerList.append(thisResult)
            } else {
                otherList.append(thisResult)
            }
        }
        let othersSorted = otherList.sorted(by: {$0.result > $1.result})
        return (bestResult, winnerList, othersSorted)
    }
    
    func getBestResult() -> Double {
        return results!.0
    }
    
    func getBestResultString() -> String {
        return "Best Result:\n\(results!.0)\n\(line)\n"
    }
    
    func getWinners() -> [NumberPairing]? {
        return results!.1
    }
    
    func getWinnerString() -> String {
        var output = "Best Number Combination:"
        for winner in results!.1 {
            output += "\n\(winner.shortReport())"
        }
        output += "\n\(line)\n"
        return output
    }
    
    func getOtherResults() -> [NumberPairing] {
        return results!.2
    }
    
    func getOtherResultsString() -> String {
        let allOtherResults = results!.2
        var output = "Other Top Results:"
        let maxResults = allOtherResults.count > 10 ? 10 : allOtherResults.count
        for index in 0 ... maxResults {
            output += "\n\(allOtherResults[index].shortReport())"
        }
        output += "\n\u{2026}\n"
        return output
    }
    
}
