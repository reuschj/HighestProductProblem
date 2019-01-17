//
//  NumberPairingProblem.swift
//  HighestProductProblem
//
//  Created by Justin Reusch on 1/9/19.
//  Copyright © 2019 Justin Reusch. All rights reserved.
//

import Foundation

/**
  * A class to define a problem by which takes two numbers that sum to a given amount (default to 8).
  * The problem must find the largest number combination (determined by multiplying the difference by the product of the two numbers)
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
        let initialHighValue = NumberPairing(oneNumberIs: 0, addingUpTo: sumOfNumberPairing)
        let lowerBounds: Double = 0
        let upperBounds: Double = sumOfNumberPairing / 2
        var overallBestResult: NumberPairing = initialHighValue
        var bestResults = [NumberPairing]()
        var otherResults = [NumberPairing]()
//        func getHighestResultOfSequence(from lowValue: Double, to highValue: Double, by precision: Double) -> NumberPairing {
//            var bestResultFromSequence: NumberPairing = initialHighValue
//            var bestResultsFromSequence = [NumberPairing]()
//
//        }
        
        // Psudocode...
        // ------------------------------------------
        // Define a new NumberPairing that will always have a zero result (used for initial high value)
        // Define variable to hold best result as NumberPairing (init with NumberPairing with zero value)
        // Define array holding best results
        // Define array holding other results
        // Define lower bounds and upper bounds constants to hold initial 0.0 and sumOfNumberPairing / 2 (these will be our accetable bounds... we need to check that nothing go outside these bounds when refining)
        // Start recusive function starting from 0.0 to sumOfNumberPairing / 2 by sumOfNumberPairing / 2
            // Define variable to hold local best result as NumberPairing (init with NumberPairing with zero value)
            // Define array holding local best results
            // For each in range...
                // Make new NumberPairing instance
                // If there is a NumberPairing:
                    // If better than local best result
                        // Set to variable holding best result
                        // Clear best result array
                        // Add to array of best results
                    // If equal to local best result:
                        // Add to array of best results
                    // Else:
                        // Add to array of other results
                // If local best result is greater than overall best result
                    // New start is .firstNumber - (current precision / 2) of best result NumberPairing
                    // If new start is lower than lower bounds, snap it to lower bounds
                    // New end is .firstNumber + (current precision / 2) of best result NumberPairing
                    // If new end is higher than upper bounds, snap it to upper bounds
                    // New precision is current precision / 2
                    // Call recusive function again with narrower range as defined above
                // Else
                    // Return the current overall result
        
        
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
