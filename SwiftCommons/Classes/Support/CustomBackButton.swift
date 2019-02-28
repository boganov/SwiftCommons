//
//  CustomBackButton.swift
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

@IBDesignable
class CustomBackButton: UIBarButtonItem {
    
    override init() {
        super.init()
        prepare()
    }
    
    init(customAction: (() -> Void)? = nil, customImage: UIImage? = nil, customColor: UIColor? = nil) {
        self.customAction = customAction
        self.customImage = customImage
        self.customColor = customColor
        super.init()
        prepare()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        prepare()
    }
    
    // MARK: - Properties
    
    @objc var customAction: (() -> Void)?
    var customImage: UIImage?
    var customColor: UIColor?
    
    // MARK: - Overrides
    
    // MARK: - Methods
    
    func prepare() {
        let button = RectInsetsOverrideButton(type: .system)
        let image = customImage ?? UIImage(named: "sc_nav_back")
        button.setImage(image?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = customColor ?? UIColor.init(hex: "0x007aff")
        button.alignmentRectInsetsOverride = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: -8)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.centerTextAndImage(spacing: 4)
        button.setTitle("    ", for: .normal)
        button.sizeToFit()
        self.customView = button
    }
    
    @objc func buttonPressed() {
        if let customAction = customAction {
            customAction()
        } else {
            UIApplication.topViewController()?.navigationController?.popViewController(animated: true)
        }
    }
}

extension UIViewController {
    @objc func setCustomBackButton(customAction: (() -> Void)? = nil, customImage: UIImage? = nil, customColor: UIColor? = nil) {
        let backButton = CustomBackButton(customAction: customAction ?? backButtonClick, customImage: customImage, customColor: customColor)
        self.navigationItem.setLeftBarButton(backButton, animated: false)
        fixNavigationItemsPosition()
    }
    
    @objc func backButtonClick() {
        self.navigationController?.popViewController(animated: true)
    }
}
