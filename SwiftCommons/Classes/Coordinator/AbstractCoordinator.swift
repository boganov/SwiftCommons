//
//  AbstractCoordinator.swift
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
