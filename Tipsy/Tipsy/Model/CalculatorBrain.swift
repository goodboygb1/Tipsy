//
//  CalculatorBrain.swift
//  Tipsy
//
//  Created by PMJs on 14/2/2563 BE.
//  Copyright © 2563 The App Brewery. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    
    var splitPercent : Double = 0.0 // ได้กี่ %
    var totalPerPerson : Double = 0.0 // คนละกี่บาท
    var splitPrice : Double = 0.0   //  ราคาทิปรวม
    
    mutating func calculateTotle(totalBill : Double ,numberOfStaff : Int)  {
        splitPrice = totalBill * splitPercent
        totalPerPerson = splitPrice/Double(numberOfStaff)
        print("calculate success")
    }
     
    func getTotalPerPerson() -> Double {
        print("totalperson = \(totalPerPerson)")
        return totalPerPerson
        
    }
    func getSplitPercent() -> Double {
        print("splitpercent = \(splitPercent)")
        return splitPercent
    }
   
   
}
