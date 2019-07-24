//
//  ButtonGradient.swift
//  iReminder
//
//  Created by Rodrigo de Anhaia on 23/07/19.
//  Copyright © 2019 Giovani Nícolas Bettoni. All rights reserved.
//

import UIKit

class ButtonGradient: UIButton {
    
    
    func setGradientBackground(colorOne: UIColor, colorTwo: UIColor) {
        let gradientLayer = CAGradientLayer()
//        var colorOne.cgColor = #colorLiteral(red: 0.3843137255, green: 0.7098039216, blue: 0.8, alpha: 1)
//        var colorTwo.cgColor = #colorLiteral(red: 0.2387163937, green: 0.4426490664, blue: 0.5015435219, alpha: 1)
        gradientLayer.frame = bounds
        gradientLayer.colors = [colorOne.cgColor, colorTwo.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 1.0, y : 1.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.0)
        
        layer.insertSublayer(gradientLayer, at: 0)
    
    }
    
}
