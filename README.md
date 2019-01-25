#  Highest Product Problem
This program solves a simple math problem...

## Problem
Find two numbers that add up to the given number (by default is 8), such that the product multiplied by the difference produces the largest possible value.

## To Run
From the command line, enter to build:

`$ swift build`

To run:

`$ swift run HighestProductProblem`

You will get a prompt that allows you to enter the number to use. The default is 8, if nothing is entered.

Optionally, you can add the number as a second argument:

`$ swift run HighestProductProblem 16`

This runs the program with 16 as the number to use.

By default, the program displays up to 10 other top results (sorted high to low). You can pass `no` or `false` as an optional second parameter in the command line to opt out of collecting other results.

`$ swift run HighestProductProblem 8 no`

or

`$ swift run HighestProductProblem 8 false`


## New
- New recursive method to find more accurate answer
- New ability to take user input from command line or input prompt
- Collecting and displaying other results is now optional

## To Do
- Write unit tests:
    - With 8 as input, 49.26722297 should be the top result.
