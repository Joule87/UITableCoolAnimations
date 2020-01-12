//
//  UIColor_Extension.swift
//  UITableCoolAnimations
//
//  Created by Julio Collado on 1/11/20.
//  Copyright © 2020 Julio Collado. All rights reserved.
//

import UIKit

extension UIColor {
    
    static func getRandomColor() -> UIColor {
        let red = CGFloat.random(in: 0...255)
        let green = CGFloat.random(in: 0...255)
        let blue = CGFloat.random(in: 0...255)
        return UIColor.rbg(r: red, g: green, b: blue)
    }
    
    static func rbg(r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor {
        return UIColor(red: r/255, green: g/255, blue: b/255, alpha: 0.3)
    }
}

