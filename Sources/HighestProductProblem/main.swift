//
//  main.swift
//  HighestProductProblem
//
//  Created by Justin Reusch on 1/9/19.
//  Copyright © 2019 Justin Reusch. All rights reserved.
//

import Foundation

// Get user input from command line, prompt or default
let sumFromCommandLineInput = NumberPairingProblem.getUserInput()

let collectOtherResults = NumberPairingProblem.lookForSecondCommand()

// Get the result and print
let twoNumbersProblem = NumberPairingProblem(addingUpTo: sumFromCommandLineInput, withOtherResults: collectOtherResults)
twoNumbersProblem.printAllResults()
