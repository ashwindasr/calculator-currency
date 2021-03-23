//
//  CalculatorModel.swift
//  Calculator
//
//  Created by macbook on 13/03/21.
//

import Foundation

class CalculatorModel: CurrencyModel, ObservableObject {
    @Published var displayedNumber: String
    private var currentNumber: Double
    private var previousNumber: Double
    private var operatorValue: String?
    private var dotFlag: Bool
    
    override init() {
        self.displayedNumber = "0"
        self.currentNumber = 0
        self.previousNumber = 0
        self.dotFlag = false
        super.init()
    }

    // MARK: Calculator Operations
    func sum() {
        //
        // Function that returns the sum of the current number and the previous number.
        //
        let result = self.currentNumber + self.previousNumber
        self.displayedNumber = checkNumber(result) ? String(Int(result)) : String(result)
    }
    
    func subtract() {
        //
        // Function that returns the difference of the current number and the previous number.
        //
        let result = self.currentNumber - self.previousNumber
        self.displayedNumber = checkNumber(result) ? String(Int(result)) : String(result)
    }
    
    func multiplication() {
        //
        // Function that returns the product of the current number and the previous number.
        //
        let result = Double(String(format: "%.2f", self.currentNumber * self.previousNumber))!
        self.displayedNumber =  checkNumber(result) ? String(Int(result)) : String(result)
    }
    
    func division() {
        //
        // Function that returns the quotient of the current number and the previous number.
        //
        if self.currentNumber != 0 {
            let result = Double(String(format: "%.2f", self.previousNumber / self.currentNumber))!
            self.displayedNumber =  checkNumber(result) ? String(Int(result)) : String(result)
        } else {
            self.displayedNumber = "ERROR"
        }
    }
    
    // MARK: Getters and Setters
    func setPreviousNumber(_ value: Double) {
        //
        // Function that sets the value to the private variable previousNumber
        //
        self.previousNumber = value
    }
    
    func setCurrentNumber(_ value: Double) {
        //
        // Function that sets the value to the private variable currentNumber
        //
        self.currentNumber = value
    }
    
    func setOperatorValue(_ value: String) {
        //
        // Function that sets the value to the private variable operatorValue
        //
        self.operatorValue = value
    }
    
    func getOperatorValue() -> String? {
        //
        // Function that returns the value of the private variable operator
        //
        return self.operatorValue
    }
    
    func setDotFlag() {
        //
        // Function that sets the value to the private variable dotFlag
        //
        self.dotFlag = true
    }
    
    func getFontSize() -> Int {
       
        let subtractValue = max(self.displayedNumber.count - 6, 0) * 7
        return 80 - subtractValue
    }
    
    func getDotFlag() -> Bool {
        //
        // Function that returns the value of the private variable dotFlag
        //
        return self.dotFlag
    }
    
    // MARK: Utility Functions
    override func clearAll() {
        //
        // Function that resets all the value of the variables
        //
        super.clearAll()
        self.displayedNumber = "0"
        self.currentNumber = 0
        self.previousNumber = 0
        self.dotFlag = false
    }
    
    func resetDotFlag() {
        //
        // Function to reset the value of the dotFlag
        //
        self.dotFlag = false
    }
    
    func buttonPressActions(_ operatorLocal: String) {
        //
        // Function to pipeline the operations that we have to do when a button is pressed
        //
        // Variables:
        // operatorLocal - A local variable to store the operator value as the name "operator" is reserved word
        //
        self.setPreviousNumber(Double(self.displayedNumber)!)
        self.displayedNumber = "0"
        self.setOperatorValue(operatorLocal)
        self.resetDotFlag()
    }
    
    func buttonPressed(_ buttonValue: String) {
        //
        // Function to handle the value from button press and call appropriate methods
        //
        
        // MARK: Switch for buttons button values
        switch buttonValue {
        
        // Math buttons
        case "+":
            self.buttonPressActions("+")
        case "-":
            self.buttonPressActions("-")
        case String("\u{00D7}"):
            self.buttonPressActions("*")
        case String("\u{00F7}"):
            self.buttonPressActions("/")
        case "=":
            // Call equalsPressed Function
            self.equalsPressed()
            
        // Dot operator
        case ".":
            if !self.getDotFlag() {
                self.displayedNumber += "."
                self.setDotFlag()
            }
            
        // Clear all
        case "AC":
            self.clearAll()
        
        // Currency buttons
        // USD
        case String("\u{0024}"):
            self.currencySymbol = String("\u{0024}")
            if self.getCurrencyFlag() {
                self.displayedNumber = self.convertCurrency(Double(self.displayedNumber)!)
                self.setCurrency("USD")
            }
        // INR
        case String("\u{20B9}"):
            self.currencySymbol = String("\u{20B9}")
            if self.getCurrencyFlag() {
                self.displayedNumber = self.convertCurrency(Double(self.displayedNumber)!)
                self.setCurrency("INR")
            }
        
        // Toggle symbol
        case String("\u{21D4}"):
            self.toggleCurrencyFlag()
        
        default:
            print("Invalid operator")
        }
    }
    
    func equalsPressed() {
        //
        // Function to carry out the necessary operations when the equal symbol is pressed
        //
        
        // MARK: Switch for = operator
        switch self.getOperatorValue() {
        case "+":
            self.setCurrentNumber(Double(self.displayedNumber)!)
            self.sum()
        case "-":
            self.setCurrentNumber(Double(self.displayedNumber)!)
            self.subtract()
        case "*":
            self.setCurrentNumber(Double(self.displayedNumber)!)
            self.multiplication()
        case "/":
            self.setCurrentNumber(Double(self.displayedNumber)!)
            self.division()
        default:
            print("invalid operation")
        }
    }

}
