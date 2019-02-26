//
//  UIViewController+.swift
//  Commons
//
//  Created by Evgeny Boganov on 15/11/2018.
//  Copyright © 2018 Mirapolis. All rights reserved.
//

import UIKit

// MARK: - ContentViewController

extension UIViewController {
    var contentViewController: UIViewController {
        if let navcon = self as? UINavigationController {
            return navcon.visibleViewController ?? self
        } else if let tabcon = self as? UITabBarController {
            return tabcon.selectedViewController ?? self
        } else {
            return self
        }
    }
}

// MARK: - Keyboard

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc
    func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension UIViewController {
    func generateSpacerNavigationForItems(items: [UIBarButtonItem]?, width: CGFloat = 8) -> [UIBarButtonItem]? {
        if #available(iOS 11.0, *) {
            guard var items = items, items.count > 0 else {
                return nil
            }
            
            let spacer = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
            spacer.width = width
            items.insert(spacer, at: 0)
            return items
        }
        return items
    }
    
    func fixNavigationItemsPosition() {
        navigationItem.setLeftBarButtonItems(generateSpacerNavigationForItems(items: navigationItem.leftBarButtonItems, width: 8), animated: false)
        navigationItem.setRightBarButtonItems(generateSpacerNavigationForItems(items: navigationItem.rightBarButtonItems, width: 8), animated: false)
    }
}
