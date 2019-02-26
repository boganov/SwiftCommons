//
//  RectInsetsOverrideButton.swift
//  Commons
//
//  Created by Evgeny Boganov on 30/07/2018.
//  Copyright © 2018 boganov. All rights reserved.
//

import UIKit

class RectInsetsOverrideButton: UIButton {
    
    var alignmentRectInsetsOverride: UIEdgeInsets?
    override var alignmentRectInsets: UIEdgeInsets {
        return alignmentRectInsetsOverride ?? super.alignmentRectInsets
    }
    
}
