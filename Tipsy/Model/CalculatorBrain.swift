//
//  CalculatorBrain.swift
//  Tipsy
//
//  Created by Flare on 15/01/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation
struct CalculatorBrain {
    
    var percentage: String
    var bill: Float
    var splits: Float

    
    func getTotal() -> String {
        let numberPercent = (Float((percentage.dropLast(1))) ?? 0)/100.0
        let total = (bill+(bill*numberPercent))/splits
        return String(format: "%.2f", total)
    }
    
    func getSettings() -> String {
        return "Split Between \(Int(splits)) people, with \(percentage) tip"
    }
}
