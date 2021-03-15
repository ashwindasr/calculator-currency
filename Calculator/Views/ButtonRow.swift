//
//  ButtonRow.swift
//  Calculator
//
//  Created by macbook on 13/03/21.
//

import SwiftUI

struct ButtonRow: View {
    @EnvironmentObject var model: CalculatorModel
    var rowValues: [String]
    var colorValues: [Color]
    var body: some View {
        HStack {
            // Show all the buttons
            ForEach(0..<rowValues.count) { index in
                ButtonView(buttonValue: rowValues[index], colorValue: colorValues[index])
            }
        }
    }
}

struct ButtonRow_Previews: PreviewProvider {
    static var previews: some View {
        ButtonRow(rowValues: ["1", "2", "3", "-"], colorValues: [.gray, .gray, .gray, .orange])
    }
}
