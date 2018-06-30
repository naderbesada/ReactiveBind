//
//  Observable.swift
//  BlurryCamera
//
//  Created by Nader Besada on 2018-05-28.
//  Copyright © 2018 Nader Besada. All rights reserved.
//

import Foundation

public class Observable<T> {
    public typealias Listener = (T) -> Void
    var listeners: [Listener?] = []
    
    public func bind(listener: Listener?) {
        self.listeners.append(listener)
    }
    
    public func bindAndFire(listener: Listener?) {
        self.listeners.append(listener)
        listener?(value)
    }
    
    /// Value of observable
    
    public var value: T {
        didSet {
            self.listeners.forEach { (listner) in
                listner?(value)
            }
        }
    }
    
    public init(_ v: T) {
        value = v
    }
    
    public typealias Subscribe = (T) -> Void
    
    /// Closure that updates with value when observable is updated
    
    public var subscribe: Subscribe?
}

