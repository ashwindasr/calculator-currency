//
//  APIModel.swift
//  Calculator
//
//  Created by macbook on 14/03/21.
//

// Sample API result
//
// request: "https://api.exchangeratesapi.io/latest?base=USD&symbols=INR"
// response: {"rates":{"INR":72.6774490908},"base":"USD","date":"2021-03-12"}
//


import Foundation

struct ConversionRates: Decodable {
    var rates: Rate
}

struct Rate: Decodable {
    var inr: Double
    
    enum CodingKeys: String, CodingKey {
        case inr = "INR"
    }
}
