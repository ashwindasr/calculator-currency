//
//  IndexView.swift
//  Calculator
//
//  Created by macbook on 13/03/21.
//

import SwiftUI

struct IndexView: View {
    @EnvironmentObject var model: CalculatorModel
    
    // Color scheme for buttons
    var darkGray = Color(CGColor(gray: 0.5, alpha: 1))
    var darkestGray = Color(CGColor(gray: 0.1, alpha: 1))
    
    var body: some View {
        // Geometry reader for the button placement. Occupy 70% of screen from the bottom.
        GeometryReader { geo in
            VStack(alignment: .trailing, spacing: 0) {
                    Spacer()
                    
                HStack {
                    
                    // Currency symbol shown only if the button is pressed
                    if model.currencyFlag {
                        Text(model.currencySymbol)
                            .font(.system(size: 80))
                            .fontWeight(.light)
                    }
                    
                    Spacer()
                    
                    // Display text
                    Text(model.displayedNumber)
                        .font(.system(size: CGFloat(model.getFontSize())))
                            .fontWeight(.light)
                            .lineLimit(1)
                }
                .padding()
                
                // Buttons
                VStack(spacing: 10) {
                        ButtonRow(rowValues: ["AC", String("\u{0024}"), String("\u{20B9}"), String("\u{00F7}")], colorValues: [darkGray, darkGray, darkGray, .orange])
                        ButtonRow(rowValues: ["1", "2", "3", String("\u{00D7}")], colorValues: [darkestGray, darkestGray, darkestGray, .orange])
                        ButtonRow(rowValues: ["4", "5", "6", "-"], colorValues: [darkestGray, darkestGray, darkestGray, .orange])
                        ButtonRow(rowValues: ["7", "8", "9", "+"], colorValues: [darkestGray, darkestGray, darkestGray, .orange])
                        ButtonRow(rowValues: ["0", String("\u{21D4}"), ".", "="], colorValues: [darkestGray, darkestGray, darkestGray, .orange])
                    }
                    .frame(height: geo.size.height * 0.7)
                }
            }
            .padding(20)
    }
}

struct IndexView_Previews: PreviewProvider {
    static var previews: some View {
        IndexView()
    }
}
