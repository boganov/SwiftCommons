//
//  LoadingAnimation.swift
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

enum LoadingAnimationPosition: String {
    case center
}

public struct LoadingAnimationType: RawRepresentable {
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
    public var rawValue: String
    static let system = LoadingAnimationType(rawValue: "System")
}

// Extend type struct/enum
/*
extension LoadingAnimationType {
    static var newAnimation: LoadingAnimationType {
        return LoadingAnimationType(rawValue: "NewAnimation")
    }
}
 */
// And extension function for view. Must have name same as struct var + View at the end
/*

extension LoadingAnimation {
    @objc private func newAnimationView() -> UIView {
        // your animation view here
        return UIView()
    }
}
 */

public class LoadingAnimation: NSObject {
    
    // MARK: - Properties
    
    static let shared = LoadingAnimation()
    
    private var animation: UIView?
    
    private var views: [String: UIView] = [:]
    
    // MARK: - Methods
    
    func show(at position: LoadingAnimationPosition, type: LoadingAnimationType = .system) {
        hide()
        let window = UIApplication.shared.keyWindow!
        var point = CGPoint()
        switch position {
        case .center:
            point = window.center
        }
        
        show(at: point, type: type)
    }
    
    func show(at point: CGPoint, type: LoadingAnimationType = .system) {
        if let view = self.getViewTypeType(type) {
            view.center = point
            let window = UIApplication.shared.keyWindow!
            window.addSubview(view)
            self.animation = view
        }
    }
    
    func pause() {
        
    }
    
    func hide() {
        if let animation = self.animation {
            animation.removeFromSuperview()
        }
    }
    
    private func getViewTypeType(_ type: LoadingAnimationType) -> UIView? {
        let selectorName = "\(type.rawValue.lowercased())View"
        if let view = views[selectorName] {
            return view
        }
        if let view = perform(Selector(selectorName))?.takeRetainedValue() as? UIView {
            views[selectorName] = view
            return view
        }
        
        return nil
    }
    
    @objc private func systemView() -> UIView {
        let window = UIApplication.shared.keyWindow!
        let view = UIView(frame: window.frame)
        let activityIndicator = UIActivityIndicatorView(style: .whiteLarge)
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        activityIndicator.center = view.center
        return view
    }
}
