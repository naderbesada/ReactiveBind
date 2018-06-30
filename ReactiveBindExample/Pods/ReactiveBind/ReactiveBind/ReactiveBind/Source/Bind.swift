//
//  Bind.swift
//  ReactiveBind
//
//  Created by Nader Besada on 2018-06-26.
//  Copyright © 2018 Nader Besada. All rights reserved.
//

import UIKit

public extension ReactiveEvent {
    
    /**
     Changes to the observable updates the UI's ReactiveEvent
     
     - parameters:
        - to: Observable to listen to
        - observableChanged: Optional closure that updates when the observable has changed
    */
    
    public func observableBind(to observable: Observable<T>?,  observableChanged: ((T) -> ())? = nil) {
        observable?.bindAndFire(listener: { (value) in
            self.onSet(value)
            observableChanged?(value)
        })
    }
}

public extension ReactiveControlEvent {
    
    /**
     Changes to the UI's ReactiveEvent updates the observable and changes to the observable updates the UI's ReactiveEvent
     
     - parameters:
        - to: Observable to listen to and to update
        - observableChanged: Optional closure that updates when the observable has changed
    */
    
    public func twoWayBind(to observable: Observable<T>?, observableChanged: ((T) -> ())? = nil) {
        observable?.bindAndFire(listener: { (value) in
            self.onSet(value)
            observableChanged?(value)
            if let subscribe = observable?.subscribe {
                subscribe(value)
            }
        })
        self.listen { val in
            observable?.value = val
        }
    }
    
    /**
     Binds a ReactiveEvent to another ReactiveEvent of the same type
     
     - parameters:
        - to: ReactiveEvent of the same type as the one binded to
    */
    
    public func bind(to view: ReactiveEvent<T>) {
        view.onSet(self.onListen())
        self.listen { (val) in
            view.onSet(val)
        }
    }
    
    /**
     Binds a ReactiveEvent to another ReactiveEvent of any type, however a value returned by map must be of the same type
     
     - parameters:
        - to: ReactiveEvent of any type
        - map: Closure that returns a value of the smae type as the ReactiveEvent binded to
    */
    
    public func bind<X>(to view: ReactiveEvent<X>, map: @escaping (T) -> (X)) {
        view.onSet(map(self.onListen()))
        self.listen { (val) in
            view.onSet(map(val))
        }
    }
    
    /**
     Changes to the UI's ReactiveEvent updates the Observable
     
     - parameters:
     - to: Observable to update
    */
    
    public func viewBind(to observable: Observable<T>?) {
        self.listen { (val) in
            observable?.value = val
            if let subscribe = observable?.subscribe {
                subscribe(val)
            }
        }
    }
}
