//
//  AbstractCoordinator.swift
//  Commons
//
//  Created by Evgeny Boganov on 08/11/2018.
//  Copyright © 2018 Mirapolis. All rights reserved.
//

import Foundation

open class AbstractCoordinator: NSObject, Coordinator {
    
    // MARK: Inits
    
    override public init() {
        guard type(of: self) != AbstractCoordinator.self else {
            fatalError(
                "AbstractCoordinator instances cannot be created. Use subclasses instead"
            )
        }
        super.init()
    }
    
    // MARK: Properties

    private var _childCoordinators: [Coordinator] = []
    
    public private(set) var started: Bool = false
    
    public var childCoordinators: [Coordinator] {
        return self._childCoordinators
    }
    
    // MARK: Public Methods
    open func start() {
        if started {
            fatalError(
                """
                \(#function) has already been called once in the lifetime of this coordinator.
                \(#function) is only intended to be called once.
                """
            )
        } else {
            started = true
        }
    }
    
    public func add(childCoordinator coordinator: Coordinator) {
        self._childCoordinators.append(coordinator)
    }
    
    public func remove(childCoordinator coordinator: Coordinator) {
        self._childCoordinators = self.childCoordinators.filter { $0 !== coordinator }
    }
}
