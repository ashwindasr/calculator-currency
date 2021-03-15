//
//  ButtonView.swift
//  Calculator
//
//  Created by macbook on 11/03/21.
//

import SwiftUI

struct ButtonView: View {
    @EnvironmentObject var model: CalculatorModel
    
    var buttonValue: String = ""
    var colorValue: Color
    
    var body: some View {
        Button(action: {
            if let value = Int(buttonValue) {
                model.displayedNumber = model.displayedNumber == "0" ? String(value) : model.displayedNumber + String(value)
            } else {
                model.buttonPressed(buttonValue)
            }
        }) {
            ZStack {
                Circle()
                    .fill(colorValue)
                
                Text(buttonValue)
                    .font(.largeTitle)
            }
        }
        .accentColor(.white)
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(buttonValue: "1", colorValue: .gray)
    }
}
