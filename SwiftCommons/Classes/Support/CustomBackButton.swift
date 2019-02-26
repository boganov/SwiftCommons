//
//  CustomBackButton.swift
//  Commons
//
//  Created by Evgeny Boganov on 29/08/2018.
//  Copyright © 2018 boganov. All rights reserved.
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
