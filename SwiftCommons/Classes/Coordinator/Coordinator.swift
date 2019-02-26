//
//  Coordinator.swift
//  Commons
//
//  Created by Evgeny Boganov on 08/11/2018.
//  Copyright © 2018 Mirapolis. All rights reserved.
//

import Foundation

public protocol Coordinator: class {
    var childCoordinators: [Coordinator] { get }
    
    func add(childCoordinator coordinator: Coordinator)
    func remove(childCoordinator coordinator: Coordinator)
    
    func start()
}
