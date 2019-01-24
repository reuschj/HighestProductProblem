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

// Get the result and print
let twoNumbersProblem = NumberPairingProblem(addingUpTo: sumFromCommandLineInput)
twoNumbersProblem.printAllResults()

// To do:
// -----------------------------------
// TODO: Make other top result collection optional
// TODO: Write unit test: With 8 as input, should get to 49.26722297 as top result
