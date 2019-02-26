//
//  LoadingAnimation.swift
//  Commons
//
//  Created by Evgeny Boganov on 05/12/2018.
//  Copyright © 2018 Mirapolis. All rights reserved.
//

import UIKit
import SwiftGifOrigin

enum LoadingAnimationPosition: String {
    case center
}

struct LoadingAnimationType: RawRepresentable {
    var rawValue: String
    static let system = LoadingAnimationType(rawValue: "System")
}

class LoadingAnimation: NSObject {
    
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
