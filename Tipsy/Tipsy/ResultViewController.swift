//
//  ResultViewController.swift
//  Tipsy
//
//  Created by PMJs on 12/2/2563 BE.
//  Copyright © 2563 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingLabel: UILabel!
    
    var totalPerPerson : Double = 0.0
    var numberOfSplit = 0
    var percentOfSplit = 0
    
    @IBAction func reCalculateButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
   override func viewDidLoad() {
    totalLabel.text = String(totalPerPerson)
    settingLabel.text = "Split between \(numberOfSplit) people, with \(percentOfSplit)% tip."
   }

    

}
