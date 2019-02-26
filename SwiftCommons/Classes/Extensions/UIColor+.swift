//
//  UIColor+.swift
//  Commons
//
//  Created by Evgeny Boganov on 08/11/2018.
//  Copyright © 2018 Mirapolis. All rights reserved.
//

import UIKit

// MARK: - RGB & RGBA inits

extension UIColor {
    convenience init(red: UInt32, green: UInt32, blue: UInt32, alpha: UInt32 = 255) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        assert(alpha > 0 && alpha <= 255, "Invalid alpha component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: CGFloat(alpha) / 255.0)
    }
    
    convenience init(rgba: UInt32) {
        self.init(
            red: (rgba >> 24) & 0xFF,
            green: (rgba >> 16) & 0xFF,
            blue: (rgba >> 8) & 0xFF,
            alpha: rgba & 0xFF
        )
    }
    
    convenience init(rgb: UInt32) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
    
    convenience init(hex: String) {
        var uppercasedString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if uppercasedString.hasPrefix("#") {
            uppercasedString.remove(at: uppercasedString.startIndex)
        }
        
        var rgbValue: UInt32 = 0
        Scanner(string: uppercasedString).scanHexInt32(&rgbValue)
        
        let red = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgbValue & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: 1)
    }
}

extension UIColor {
    var isLight: Bool {
        let ci = CIColor(color: self)
        let luminance = 0.299 * ci.red + 0.587 * ci.green + 0.114 * ci.blue
        return luminance > 0.5
    }
}
