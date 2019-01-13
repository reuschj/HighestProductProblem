//
//  main.swift
//  HighestProductProblem
//
//  Created by Justin Reusch on 1/9/19.
//  Copyright © 2019 Justin Reusch. All rights reserved.
//

import Foundation

let twoNumbersProblem = NumberPairingProblem(addingmaxResults: 8, withPrecision: 0.1)
print(twoNumbersProblem.introString)
print(twoNumbersProblem.getBestResultString())
print(twoNumbersProblem.getWinnerString())
print(twoNumbersProblem.getOtherResultsString())


