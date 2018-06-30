//
//  Listener.swift
//  ReactiveBind
//
//  Created by Nader Besada on 2018-06-26.
//  Copyright © 2018 Nader Besada. All rights reserved.
//

import UIKit

protocol Listenable: class {
    associatedtype ListenType
    func listen(listener: @escaping (ListenType) -> ())
}

class Listener {
    typealias ListenerType = () -> ()
    private var listeners: [ListenerType] = []
    
    init<V: UIControl>(view: V, event: UIControlEvents, listener: @escaping ListenerType) {
        self.listeners.append(listener)
        view.addTarget(self, action: #selector(actionEvent), for: event)
    }
    
    @objc private func actionEvent() {
        self.listeners.forEach { (listner) in
            listner()
        }
    }
}
