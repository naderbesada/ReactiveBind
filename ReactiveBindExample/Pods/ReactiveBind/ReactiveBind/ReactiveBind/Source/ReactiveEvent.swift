//
//  ViewModelBind.swift
//  BlurryCamera
//
//  Created by Nader Besada on 2018-05-29.
//  Copyright © 2018 Nader Besada. All rights reserved.
//

import Foundation

import Foundation
import UIKit

// Change name when expanding project

public class ReactiveEvent<T> {
    var onSet: (T) -> ()
    var listener: Listener!
    
    init(onSet: @escaping (T) -> ()) {
        self.onSet = onSet
    }
}

public class ReactiveControlEvent<T>: ReactiveEvent<T>, Listenable {
    var onListen: () -> (T)
    private var listenClosure: ((T) -> ())?
    
    /**
     Listens to changes in the UI's ReactiveEvent
     
     - parameters:
        - observableChanged: Closure that updates when the the UI's ReactiveEvent has changed
    */
    
    public func listen(listener: @escaping (T) -> ()) {
        self.listenClosure = listener
    }
    
    init<V: UIControl>(_ view: V, controlEvent: Event, onSet: @escaping (T) -> (), onListen: @escaping () -> (T)) {
        self.onListen = onListen
        super.init(onSet: onSet)
        self.listener = Listener(view: view, event: controlEvent.event, listener: {
            self.listenClosure?(onListen())
        })
    }
}

public class VoidReactiveEvent: Listenable {
    private var listener: Listener!
    private var listenClosure: ((()) -> ())?
    
    /**
     Listens to changes in the UI's ReactiveEvent
     
     - parameters:
        - observableChanged: Closure that updates when the the UI's ReactiveEvent has changed
    */
    
    public func listen(listener: @escaping (()) -> ()) {
        self.listenClosure = listener
    }
    
    init<V: UIControl>(_ view: V, controlEvent: Event) {
        self.listener = Listener(view: view, event: controlEvent.event, listener: {
            self.listenClosure?(())
        })
    }
}
