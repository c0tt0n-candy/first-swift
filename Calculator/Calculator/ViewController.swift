//
//  ViewController.swift
//  Calculator
//
//  Created by Yutaka Okubo on 2019/01/01.
//  Copyright © 2019 Yutaka Okubo. All rights reserved.
//

import UIKit

enum Operator {
    case undefined
    case addition
    case subtraction
    case multiplication
    case division
}

class ViewController: UIViewController {
    var firstValue = 0
    var secondValue: Int?
    var currentOperation = Operator.undefined
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func numberButtonTapped(_ sender: UIButton) {
        var value = 0
        switch sender.currentTitle {
        case "0":
            value = 0
        case "1":
            value = 1
        case "2":
            value = 2
        case "3":
            value = 3
        case "4":
            value = 4
        case "5":
            value = 5
        case "6":
            value = 6
        case "7":
            value = 7
        case "8":
            value = 8
        case "9":
            value = 9
        default:
            value = 0
        }
        
        if currentOperation == .undefined {
            firstValue = firstValue * 10 + value
            label.text = "\(firstValue)"
        } else {
            if let second = secondValue {
                secondValue = second * 10 + value
            } else {
                secondValue = value
            }
            label.text = "\(secondValue!)"
        }
    }
    
    @IBAction func operationButtonTapped(_ sender: UIButton) {
        switch sender.currentTitle {
        case "+":
            currentOperation = .addition
        case "-":
            currentOperation = .subtraction
        case "×":
            currentOperation = .multiplication
        case "÷":
            currentOperation = .division
        default:
            currentOperation = .undefined
        }
    }
    
    @IBAction func equalButtonTapped(_ sender: UIButton) {
        var result: Int?
        if let second = secondValue {
            switch currentOperation {
            case .addition:
                result = firstValue + second
            case .subtraction:
                result = firstValue - second
            case .multiplication:
                result = firstValue * second
            case .division:
                if (second != 0) {
                    result = firstValue / second
                }
            case .undefined:
                result = firstValue
            }
        } else {
            result = firstValue
        }
        
        if let res = result {
            label.text = "\(res)"
        } else {
            label.text = "Not a number"
        }
        
        clearData()
    }
    
    @IBAction func allClearButtonTapped(_ sender: UIButton) {
        clearData()
        label.text = "\(firstValue)"
    }
    
    private func clearData() {
        firstValue = 0
        secondValue = nil
        currentOperation = .undefined
    }
}
