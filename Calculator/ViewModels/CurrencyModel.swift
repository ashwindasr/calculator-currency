//
//  CurrencyModel.swift
//  Calculator
//
//  Created by macbook on 13/03/21.
//

import Foundation
class CurrencyModel {
    private var currency: String
    @Published var currencyFlag: Bool
    @Published var currencySymbol: String
    @Published var currencyRate: Double
    
    init() {
        self.currency = "INR"
        self.currencySymbol = String("\u{20B9}")
        self.currencyFlag = false
        self.currencyRate = 0.0
        
        self.getRate()
    }
    
    func clearAll() {
        //
        // Function to clear all values related to the CurrencyModel model
        //
        self.currency = "INR"
        self.currencyFlag = false
        self.currencySymbol = String("\u{20B9}")
    }
    
    func getCurrencyFlag() -> Bool {
        //
        // Getter function to return the value of private variable currencyFlag
        //
        return self.currencyFlag
    }
    
    func toggleCurrencyFlag() {
        //
        // Function to toggle the Bool value of currency flag
        //
        self.currencyFlag = self.currencyFlag ? false : true
    }
    
    func setCurrency(_ value: String) {
        //
        // Setter funtion to set the value of the private variable currency
        //
        self.currency = value
    }
    
    func checkNumber(_ number: Double) -> Bool {
        //
        // Function to check whether the value after the decimal point is zero
        //
        return number - Double(Int(number)) == 0 ? true : false
    }
    
    func convertCurrency(_ amount: Double) -> String {
        //
        // Function to convert the currency from USD to INR or vice versa
        //
        var result =  currency == "INR" ? amount / currencyRate : amount * currencyRate
        result = Double(String(format: "%.2f", result))!
        return checkNumber(result) ? String(Int(result)) : String(result)
    }
    
    func getRate() {
        //
        // Function to get the current rate using the API
        //
        let websiteURL = "https://api.exchangeratesapi.io/latest?base=USD&symbols=INR"
        guard let url = URL(string: websiteURL) else {
            return
        }
                
        URLSession.shared.dataTask(with: url) { (data, response, error) in
                    do {
                        guard let data = data else { return }
                        let result = try JSONDecoder().decode(ConversionRates.self, from: data)
                        DispatchQueue.main.async {
                            self.currencyRate = result.rates.inr
                        }
                    } catch {
                        print("Error decoding JSON: ", error)
                    }
                }.resume()
    }
}
