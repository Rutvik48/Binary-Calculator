//
//  BinaryMultViewController.swift
//  Binary Calculator
//
//  Created by RV on 6/17/19.
//  Copyright © 2019 RV. All rights reserved.
//

import UIKit

class BinaryMultViewController: UIViewController {
    
    @IBOutlet weak var entryField1: UITextField!
    @IBOutlet weak var entryField2: UITextField!
    @IBOutlet weak var answerLabel: UILabel!
     @IBOutlet var mainView: UIView!
    
    let binaryCalculator = BinaryCalculator()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        // Creating a gradient
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

        return binaryCalculator.performMultiplication(entryField1.text!, entryField2.text!)
    }
    
    
    @IBAction func generateAnsBtn(_ sender: Any) {
        
        if (validateInput( entryField1) && validateInput(entryField2)){

            answerLabel.text =  performAddition()
        }
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

