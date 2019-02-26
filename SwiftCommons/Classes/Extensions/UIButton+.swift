//
//  UIButton.swift
//  Commons
//
//  Created by Evgeny Boganov on 30/07/2018.
//  Copyright © 2018 boganov. All rights reserved.
//

import UIKit

extension UIButton {
    func centerTextAndImage(spacing: CGFloat = 6.0) {
        let insetAmount = spacing / 2
        imageEdgeInsets = UIEdgeInsets(top: 0, left: -insetAmount, bottom: 0, right: insetAmount)
        titleEdgeInsets = UIEdgeInsets(top: 0, left: insetAmount, bottom: 0, right: -insetAmount)
        contentEdgeInsets = UIEdgeInsets(top: 0, left: insetAmount, bottom: 0, right: insetAmount)
    }
}

extension UIButton {
    func setDualTitle(left: String, right: String, horizontalMargin: CGFloat = 8) {
        let columnCount = (UIScreen.main.bounds.width - (horizontalMargin * 2)) * 0.2
        let columns = String(repeating: "_", count: Int(columnCount))
        let attributedString = NSMutableAttributedString(string: left, attributes: [.foregroundColor: tintColor])
        attributedString.append(NSAttributedString(string: columns, attributes: [.foregroundColor: UIColor.black]))
        attributedString.append(NSAttributedString(string: right, attributes: [.foregroundColor: tintColor]))
        setAttributedTitle(attributedString, for: .normal)
        contentEdgeInsets = UIEdgeInsets(top: 0, left: horizontalMargin, bottom: 0, right: horizontalMargin)
    }
}

extension UIButton {
    private func imageWithColor(color: UIColor) -> UIImage? {
        let rect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
    
    func setBackgroundColor(_ color: UIColor, for state: UIControl.State) {
        self.setBackgroundImage(imageWithColor(color: color), for: state)
    }
}
