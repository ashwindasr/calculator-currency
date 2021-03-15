//
//  CalculatorApp.swift
//  Calculator
//
//  Created by macbook on 11/03/21.
//

import SwiftUI

@main
struct CalculatorApp: App {
    var body: some Scene {
        WindowGroup {
            IndexView()
                .environmentObject(CalculatorModel())
                .preferredColorScheme(.dark)
        }
    }
}
