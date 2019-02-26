//
//  HTTPMethod.swift
//  Commons
//
//  Created by Evgeny Boganov on 03/12/2018.
//  Copyright © 2018 Mirapolis. All rights reserved.
//

import Foundation

public enum HTTPMethod: String {
    case get = "GET"
    case put = "PUT"
    case post = "POST"
    case delete = "DELETE"
    case head = "HEAD"
    case options = "OPTIONS"
    case trace = "TRACE"
    case connect = "CONNECT"
    case patch = "PATCH"
}
