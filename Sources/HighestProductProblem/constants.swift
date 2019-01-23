//
//  constants.swift
//  HighestProductProblem
//
//  Created by Justin Reusch on 1/9/19.
//  Copyright © 2019 Justin Reusch. All rights reserved.
//

import Foundation

// The default version of this problem is two numbers that add to 8
let defaultSum: Double = 8

// The minimum level of precision we care about... beyond this point, we'll consider values equal
let minimumPrecision = 0.0000000001

// Lines of various length
fileprivate let lineChar = "-"
fileprivate let lineBaseLength = 9
let lineShort = String(repeating: lineChar, count: lineBaseLength * 1)
let lineMedium = String(repeating: lineChar, count: lineBaseLength * 2)
let lineLong = String(repeating: lineChar, count: lineBaseLength * 3)
