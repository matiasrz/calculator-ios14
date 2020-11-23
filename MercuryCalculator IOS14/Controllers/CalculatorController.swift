//
//  ViewController.swift
//  MercuryCalculator IOS14
//
//  Created by Matias Rojas Zuñiga on 22/11/2020.
//

import UIKit

class CalculatorController: UIViewController {

    @IBOutlet weak var displayLabel: UILabel!

    private var calculator = CalculatorLogic()
    
    private var isFinishedTypingNumber: Bool = true

    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot convert display label text to a Double.")
            }
            return number
        }
        set {
            displayLabel.text = String(newValue)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        isFinishedTypingNumber = true
        calculator.setNumber(displayValue)
        
        if let operation = sender.currentTitle {
            if let result = calculator.calculate(with: operation) {
                displayValue = result
            }
        }
    }
    
    @IBAction func numberButtonPressed(_ sender: UIButton) {
        
        if let number = sender.currentTitle {
            
            if isFinishedTypingNumber {
                displayLabel.text = number
                isFinishedTypingNumber = false
            } else {
                
                if number == "." {
                    let isInt = floor(displayValue) == displayValue
                    if !isInt {
                        return
                    }
                }
                displayLabel.text! += number
            }
            
        }
    }
}
