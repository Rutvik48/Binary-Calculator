//
//  BinaryAdditionViewController.swift
//  Binary Calculator
//
//  Created by RV on 6/16/19.
//  Copyright © 2019 RV. All rights reserved.
//

import UIKit

class BinaryAdditionViewController: UIViewController {

    @IBOutlet weak var entryField1: UITextField!
    @IBOutlet weak var entryField2: UITextField!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet var mainView: UIView!
    
    let binaryCalculator = BinaryCalculator()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Create gradient background for the main view
        mainView.setGradientMainView()
    }
    
    func validateInput(_ entryField:UITextField) -> Bool{
        
        let binaryCalculator = BinaryCalculator()
        
        if (!binaryCalculator.validateBinary(binaryString: entryField.text!)){
            
            entryField.layer.borderWidth = 1.0
            entryField.layer.borderColor = UIColor.red.cgColor
            
            // string contained non-digit characters
            binaryCalculator.showToast(controller: self, message : "Check Your Input.", seconds: 2.0)
            
            return false
        }
        
        return true
        
    }
    
    
    func performAddition() -> String{
        
        return binaryCalculator.performAddition(entryField1.text!, entryField2.text!)
    }
    
    @IBAction func generateAnswer(_ sender: Any) {
        
        if (validateInput( entryField1) && validateInput(entryField2)){
            
            answerLabel.text =  performAddition()
        }
    
    }
    
}
