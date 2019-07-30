//
//  ButtonGradient.swift
//  iReminder
//
//  Created by Rodrigo de Anhaia on 23/07/19.
//  Copyright © 2019 Giovani Nícolas Bettoni. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    
    func setGradientBackground(colorOne: UIColor, colorTwo: UIColor, colorThree: UIColor) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [colorOne.cgColor, colorTwo.cgColor, colorThree.cgColor]
        gradientLayer.locations = [0.0, 0.2,1.0]
        gradientLayer.startPoint = CGPoint(x: 1.0, y : 1.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.0)
        layer.cornerRadius = CGFloat(20)
        layer.insertSublayer(gradientLayer, at: 0)
    
    }
    
}
