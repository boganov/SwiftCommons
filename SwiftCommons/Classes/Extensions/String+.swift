//
//  String+.swift
//  Commons
//
//  Created by Evgeny Boganov on 04/12/2018.
//  Copyright © 2018 Mirapolis. All rights reserved.
//

import Foundation

extension String {
    static func random(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0...length-1).map { _ in letters.randomElement()! })
    }
}
