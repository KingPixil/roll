//
//  ViewController.swift
//  roll
//
//  Created by Kabir Shah on 7/19/16.
//  Copyright © 2016 Kabir Shah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let gradientLayer = CAGradientLayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // background gradient
        self.view.backgroundColor = UIColor.blueColor()
        gradientLayer.frame = self.view.bounds
        let color1 = UIColor(red: 0.20, green: 0.56, blue: 0.31, alpha: 1.0).CGColor as CGColorRef
        let color2 = UIColor(red: 0.34, green: 0.71, blue: 0.83, alpha: 1.0).CGColor as CGColorRef
        gradientLayer.colors = [color1, color2]
        gradientLayer.locations = [0.0, 1.0]
        self.view.layer.addSublayer(gradientLayer)
        
    }

    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }


}

