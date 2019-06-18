//
//  TopContainerViewController.swift
//  Binary Calculator
//
//  Created by RV on 6/15/19.
//  Copyright © 2019 RV. All rights reserved.
//

import UIKit

class TopContainerViewController: UIViewController {
    
    @IBOutlet var calcModeNames: [UIButton]!
    
    
    @IBOutlet weak var currentMode: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        currentMode.titleLabel?.minimumScaleFactor = 0.5;
        currentMode.titleLabel?.adjustsFontSizeToFitWidth = true;
        calcModeNames.forEach{(button) in
            button.titleLabel?.minimumScaleFactor = 0.5;
            button.titleLabel?.adjustsFontSizeToFitWidth = true;
        }
        
    }
    
    @IBAction func currentSelection(_ sender: Any) {
         showHideDropMenu()
    }
    
    func showHideDropMenu(){
        calcModeNames.forEach{(button) in
            UIView.animate(withDuration: 0.3, animations: {
                button.isHidden = !button.isHidden
                self.view.layoutIfNeeded()
            })
        }
    }
    
    enum Options: String{
        case binaryGenerator = "Binary Generator"
        case decimalGenerator = "Decimal Generator"
        case binaryMultiplication = "Binary Multiplication"
        case binaryAddition = "Binary Addition"
    }
    
    @IBAction func modeSelected(_ sender: Any) {
        
        guard let selectedOption = (sender as AnyObject).currentTitle, let options = Options(rawValue: selectedOption!) else{
            return
        }
        
        switch options {
        case .binaryGenerator:
            print("Binary Generator Selected")
        case .binaryAddition:
            print("Binary Addition Selected")
        case .binaryMultiplication:
            print("Binary Multiplication Selected")
        default:
            print("Decimal Generator Slected")
        }
        currentMode.setTitle(selectedOption, for: .normal)
        showHideDropMenu()    }
    
}
