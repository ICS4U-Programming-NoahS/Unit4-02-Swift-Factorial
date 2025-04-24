//
// Factorial.swift
//
// Created by Noah Smith
// Created on 2025-04-22
// Version 1.0
// Copyright (c) 2025 Noah Smith. All rights reserved.
//
// The Factorial program will read a set of whole numbers from 'input.txt'.
// It will check if it is a valid whole number.
//If it is not a valid whole number, it will write an error message.
// It will then calculate the factorial of each valid whole number.
// Finally, it will write the factorials to 'output.txt'.

// Import foundation library
import Foundation

// Function to calculate the factorial
func factorial(_ number: Int) -> Int {

    // Base case
    if number == 0 {

        // Return 1
        // because 0! = 1
        return 1

    // Recursive case
    } else {

        // Call the factorial method recursively
        // and multiply the number by the factorial of that number - 1
        // Return the factorial of the number
        return (number * factorial(number - 1))
    }
}

// Greeting and program description
print("Welcome to the factorial program!");
print("The Factorial program will read a set");
print(" of whole numbers from 'input.txt'.");
print("It will check if it is a valid whole number.");
print("If it is not a valid whole number,");
print(" it will write an error message.");
print("It will then calculate the factorial");
print(" of each valid whole number.");
print("It will write the factorials to 'output.txt'.");

// initialize output string
var outputStr = ""

// open input file for reading
let inputPath = "./input.txt"

// Create output file
let outputPath = "./output.txt"

do {
    // Read all lines, one by one
    let fileContent = try String(contentsOfFile: inputPath)

    // Split the file content into lines
    let lines = fileContent.components(separatedBy: .newlines)

    // initialize index 
    var index = 0
    
    // while it has not reached the end of the file
    while index < lines.count {

        // set the line to current line
        let line = lines[index]

                // Try to convert to an integer
                if let number = Int(line) {

                    // Check if it is not a whole number
                    if number < 0 {

                        // write error message
                        outputStr += "'\(line)' is not a valid whole number.\n"
                    } else {
                        // function call
                        let factorial = factorial(number)

                        // write the factorial to the output string
                        outputStr += "\(number)! = \(factorial)\n"
                    }

                // if it is an invalid whole number
                } else {
                    // write error message
                    outputStr += "'\(line)' is not a valid whole number.\n"
                }

        // increment index
        index += 1
    }

    // write the output string to the output file
    try outputStr.write(toFile: outputPath, atomically: true, encoding: .utf8)

    // Display success message
    print("\nSuccessfully wrote to file 'output.txt'.")

// If there's a file error
} catch {
    // Display file error message
    print("A file error occurred.")
}
