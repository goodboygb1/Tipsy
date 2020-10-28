//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var zeroPcttextfield: UIButton!
    @IBOutlet weak var onePctText: UIButton!
    @IBOutlet weak var twentyPctText: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var numberStepper: UIStepper!
    var calculatorBrain = CalculatorBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        if(sender.tag == 0) {
            stopAllSelect()
            zeroPcttextfield.isSelected = true
            calculatorBrain.splitPercent = 0
        } else if(sender.tag == 10) {
            stopAllSelect()
            onePctText.isSelected = true
        calculatorBrain.splitPercent = 0.1
        } else if (sender.tag == 20){
            stopAllSelect()
            twentyPctText.isSelected = true
        calculatorBrain.splitPercent = 0.2
        }
       
    }
    
    @IBAction func stpperValueUpdate(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
    }
    
    @IBAction func calculateButton(_ sender: Any) {
        
        let totalBill = billTextField.text ?? "0"
        let numberOfStaff = splitNumberLabel.text ?? "0"
       
        if totalBill != "" {
        calculatorBrain.calculateTotle(totalBill: Double(totalBill)!, numberOfStaff: Int(numberOfStaff)!)
        self.performSegue(withIdentifier: "result", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "result" {
            let destinationVc = segue.destination as! ResultViewController
            destinationVc.totalPerPerson = Double(Int(calculatorBrain.getTotalPerPerson()))
            destinationVc.numberOfSplit = Int(splitNumberLabel.text!)!
            
            if calculatorBrain.getSplitPercent() == 0.1 {
                destinationVc.percentOfSplit = 10
            } else if calculatorBrain.getSplitPercent() == 0.2 {
                destinationVc.percentOfSplit = 20
            }
            else {
                destinationVc.percentOfSplit = 30
            }
        }
    }
    
    func stopAllSelect()  {
         onePctText.isSelected = false
                   twentyPctText.isSelected = false
                   zeroPcttextfield.isSelected = false
    }
    
   
}

