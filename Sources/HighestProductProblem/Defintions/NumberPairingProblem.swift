//
//  NumberPairingProblem.swift
//  HighestProductProblem
//
//  Created by Justin Reusch on 1/9/19.
//  Copyright © 2019 Justin Reusch. All rights reserved.
//

import Foundation

/**
  A class to define a problem by which takes two numbers that sum to a given amount (default to 8). The problem must find the largest number combination (determined by multiplying the difference by the product of the two numbers)
 */
class NumberPairingProblem {
    let sumOfNumberPairing: Double
    var introString: String {
        return "Problem:\nFind two numbers that add up to \(roundNumberToString(from: sumOfNumberPairing)), such that the product multiplied by the difference produces the largest possible value.\n"
    }
    // Private propety to store results
    private var results: (Double, [NumberPairing], [NumberPairing])!
    // Accesses best result
    var bestResult: Double {
        return results.0
    }
     // Accesses best result and output as a formatted string report
    var bestResultReport: String {
        return "Best Result:\n\(results.0)\n\(lineMedium)\n"
    }
    // Acesses an array of winning number pairings
    var bestNumberPairings: [NumberPairing] {
        return results.1
    }
    // Acesses an array of winning number pairings and outputs as formatted string report
    var bestNumberPairingsReport: String {
        var output = "Best Number Combination:"
        for winner in results.1 {
            output += "\n\(winner.shortReport())"
        }
        output += "\n\(lineMedium)\n"
        return output
    }
    // Acesses an array of other number pairings
    var otherNumberPairings: [NumberPairing] {
        return results.2
    }
    // Acesses an array of other number pairings and outputs as formatted string report
    var otherNumberPairingsReport: String {
        let allOtherResults = results.2
        var output = "Other Top Results:"
        let maxResults = allOtherResults.count > 10 ? 10 : allOtherResults.count
        for index in 0 ... maxResults {
            output += "\n\(allOtherResults[index].shortReport())"
        }
        output += "\n\u{2026}\n"
        return output
    }
    
    // Initializers ---------------------------------------------------------- /
    
    init(addingmaxResults initialSum: Double) {
        self.sumOfNumberPairing = initialSum
        self.results = self.getResults()
    }
    convenience init() {
        self.init(addingmaxResults: 8)
    }
    
    // Methods --------------------------------------------------------------- /
    
    // TODO: This will be updated to be a recursive method
    private func getResults() -> (Double, [NumberPairing], [NumberPairing]) {
        let precision = 0.1
        var searchRange: StrideThrough<Double> {
            return stride(from: 0.0, through: sumOfNumberPairing / 2, by: precision)
        }
        var bestResult: Double = 0
        var winnerList: Array<NumberPairing> = []
        var otherList: Array<NumberPairing> = []
        for number in searchRange {
            let thisResult = NumberPairing(oneNumberIs: number, addingUpTo: sumOfNumberPairing)
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
    // Prints all results
    func printAllResults() -> Void {
        print(twoNumbersProblem.introString)
        print(twoNumbersProblem.bestResultReport)
        print(twoNumbersProblem.bestNumberPairingsReport)
        print(twoNumbersProblem.otherNumberPairingsReport)
    }
}
