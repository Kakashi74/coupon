//
//  GradientExtension.swift
//  Sallah
//
//  Created by Ahmed on 4/2/20.
//  Copyright © 2020 AhmedDev. All rights reserved.
//

import Foundation
import UIKit


extension  UIView {

    func setGradientBackGround(firstColor: UIColor , secondColor: UIColor) {
     
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [firstColor.cgColor , secondColor.cgColor]
        gradientLayer.locations = [0.0 , 1.0]
        gradientLayer.startPoint = CGPoint(x:1.0 , y:1.0)
        gradientLayer.endPoint = CGPoint(x:0.1 , y: 1.0)
        
        
        layer.insertSublayer(gradientLayer, at: 0)
        
        
    }
  
}
