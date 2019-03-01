//
//  UIView+.swift
//  SwiftCommons
//
//  Copyright (c) 2019 Evgeny Boganov <boganov@gmail.com>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import UIKit

extension UIView {
    public func removeAllSubViews() {
        self.subviews.forEach({ $0.removeFromSuperview() })
    }
}

extension UIView {
    
    public var safeTopAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.topAnchor
        } else {
            return self.topAnchor
        }
    }
    
    public var safeLeftAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.leftAnchor
        } else {
            return self.leftAnchor
        }
    }
    
    public var safeRightAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.rightAnchor
        } else {
            return self.rightAnchor
        }
    }
    
    public var safeBottomAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.bottomAnchor
        } else {
            return self.bottomAnchor
        }
    }
}

extension UIView {
    public func setShadow(radius: CGFloat = 2.0) {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.masksToBounds = false
        self.layer.shadowRadius = radius
        self.layer.shadowOpacity = 1
    }
}

extension UIView {
    public static func loadFromXib<T>(withOwner: Any? = nil, options: [UINib.OptionsKey: Any]? = nil) -> T where T: UIView {
        let bundle = Bundle(for: self)
        let nib = UINib(nibName: "\(self)", bundle: bundle)
        
        guard let view = nib.instantiate(withOwner: withOwner, options: options).first as? T else {
            fatalError("Could not load view from nib file.")
        }
        return view
    }
}

extension UIView {
    public func shake() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.07
        animation.repeatCount = 3
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 10, y: self.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 10, y: self.center.y))
        
        self.layer.add(animation, forKey: "position")
    }
}

extension UIView {
    public func clearConstraints() {
        for subview in self.subviews {
            subview.clearConstraints()
        }
        self.removeConstraints(self.constraints)
    }
}

extension UIView {
    public func rotate(degrees: CGFloat) {
        rotate(radians: CGFloat.pi * degrees / 180.0)
    }
    
    public func rotate(radians: CGFloat) {
        self.transform = CGAffineTransform(rotationAngle: radians)
    }
}
