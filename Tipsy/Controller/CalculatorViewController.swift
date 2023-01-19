//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    var calculatorBrain = CalculatorBrain(percentage: "10%", bill: 0, splits: 2)
    
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var tenPctButton: UIButton!
    
    
    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        billTextField.endEditing(true)
        calculatorBrain.percentage = sender.currentTitle!
        
        
    }

    @IBAction func splitChanged(_ sender: UIStepper) {
        splitLabel.text = String(Int(sender.value))
        billTextField.endEditing(true)
        calculatorBrain.splits = Float(sender.value)
        
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        calculatorBrain.bill = Float(billTextField.text!) ?? 0.0
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.total = calculatorBrain.getTotal()
            destinationVC.settings = calculatorBrain.getSettings()
            
            
        }
    }
}
