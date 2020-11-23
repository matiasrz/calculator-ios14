//
//  CalculatorLogic.swift
//  MercuryCalculator IOS14
//
//  Created by Matias Rojas Zuñiga on 23/11/2020.
//

import Foundation

struct CalculatorLogic {
    
    private var number: Double?
    private var intermediateCalc: (num: Double, operation: String)?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    private func performTwoNumCalculation(_ n2: Double) -> Double? {
        if let n1 = intermediateCalc?.num,
           let operation = intermediateCalc?.operation {
            switch operation {
            case "x":
                return n1 * n2
            case "÷":
                return n1 / n2
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            default:
                fatalError("The operation passed in does not match any of the cases.")
            }
        }
        return nil
    }
    
    mutating func calculate(with symbol: String) -> Double? {

        if let n = number {
            switch symbol {
            case "AC":
                return 0
            case "+/-":
                return n * -1
            case "%":
                return n * 0.01
            case "=":
                return performTwoNumCalculation(n)
            default:
                intermediateCalc = (num: n, operation: symbol)
            }
        }
        
        return nil
    }
}
