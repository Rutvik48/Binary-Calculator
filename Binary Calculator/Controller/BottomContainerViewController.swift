//
//  BottomContainerViewController.swift
//  Binary Calculator
//
//  Created by RV on 6/15/19.
//  Copyright © 2019 RV. All rights reserved.
//

import UIKit

class BottomContainerViewController: UIViewController {
    
    @IBOutlet weak var ans1: UILabel!
    @IBOutlet weak var num1: UITextField!
    @IBOutlet var mainView: UIView!
    
    var tempNum:Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Create gradient background for the main view
        mainView.setGradientMainView()
    }
    
    // Generates binery of given integer
    func getBinery(_ value: Int)-> String{
        
        let binaryCalculator = BinaryCalculator()
        
        return ( binaryCalculator.getDecimalToBinary(value: value))
        
    }
    
    // Creates a small pop-up using alert class, to show user small message
    func showToast(controller: UIViewController, message : String, seconds: Double) {
        
        // Setting up the alert
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.view.backgroundColor = UIColor.black
        alert.view.alpha = 0.6
        alert.view.layer.cornerRadius = 15
        controller.present(alert, animated: true)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + seconds) {
            alert.dismiss(animated: true)
        }
    }
    
    //Checks the input if it is valid, if string is a number or not
    func validateInput(_ input1:String)-> Bool{
        
        //First removes extra white spaces from input
        let input = input1.trimmingCharacters(in: .whitespacesAndNewlines)
        let numberCharacters = NSCharacterSet.decimalDigits.inverted
        
        // Input from user has to be less than 10 digits.
        if(!validateLength(input)){
            return false
        }
        //After removing whitespaces checking if it not empty and it is a number
        if !input.isEmpty && input.rangeOfCharacter(from: numberCharacters) == nil {
            
            // "tempNum" is an int, changing input string to integer
            tempNum =  Int(input)!
            return true
            
        } else {
            
            // string contained non-digit characters
            showToast(controller: self, message : "Check Your Input.", seconds: 2.0)
            return false
            
        }
    }
    
    func validateLength(_ input: String)-> Bool{
        
        if (input.count  > 10){
            showToast(controller: self, message : "Input must be less than 10 digits.", seconds: 2.0)
            return false
        }else{
            return true
        }
    }
    
    // This method is called when user click any "Generate binery" button
    func startProcess(_ num:UITextField, _ ans:UILabel){
        
        // Checking  input(num) is not empty
        if(num.text != ""){
            
            // Methond to validate the given input by user
            if(validateInput(num.text!)){
                
                // Finally getting binery value of the input, by calling getBinery method
                ans.text = getBinery(tempNum)
            }else{
                
                ans.text = "Answer"
            }
        }
    }
    
    // First (Top) Generate Binery button
    @IBAction func btn1(_ sender: Any) {
        
        startProcess(num1, ans1)
        
    }
    
    
    
    //    // Second (Middle) Generate Binery button
    //    @IBAction func btn2(_ sender: Any) {
    //
    //        startProcess(num2, ans2)
    //
    //    }
    //
    //    // Third (Bottom) Generate Binery button
    //    @IBAction func btn3(_ sender: Any) {
    //
    //        startProcess(num3, ans3)
    //
    //    }
    
    
}
