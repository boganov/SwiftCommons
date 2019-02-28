//
//  UIViewController+.swift
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
