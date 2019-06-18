//
//  UIView+Extention.swift
//  Binary Calculator
//
//  Created by RV on 6/17/19.
//  Copyright © 2019 RV. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func setGradientBackground(colorOne: UIColor, colorTwo: UIColor) {
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [colorOne.cgColor, colorTwo.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 1.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.0)
        
        layer.insertSublayer(gradientLayer, at: 0)
    }
    func setGradientMainView(){
        secondGredient()
    }
    
    func seGradientButton(){
        
    }
    func firstGredient(){
        setGradientBackground(colorOne: Colors.lightSilver, colorTwo: Colors.darkGrey)
    }
    
    func secondGredient(){
        setGradientBackground(colorOne: Colors.someGreen, colorTwo: Colors.veryDarkBlue)
    }
}
