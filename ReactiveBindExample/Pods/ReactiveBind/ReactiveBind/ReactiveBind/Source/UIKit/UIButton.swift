//
//  UIButton.swift
//  ReactiveBind
//
//  Created by Nader Besada on 2018-06-26.
//  Copyright © 2018 Nader Besada. All rights reserved.
//

import UIKit

public extension Reactive where Base: UIButton {
    
    /// VoidReactiveEvent that corresponds to UIButton's touchUpInside control
    
    public var tap: VoidReactiveEvent {
        return VoidReactiveEvent(
            self.base, controlEvent:
            ButtonEvents.buttonTapped
        )
    }
    
    /**
     VoidReactiveEvent that corresponds to a UIButton event
     
     - parameters:
        - format: Formated string
     
     - returns:
    VoidReactiveEvent
    */
    
    public func onEvent(_ event: ButtonEvents) -> VoidReactiveEvent {
        return VoidReactiveEvent(
            self.base,
            controlEvent: event
        )
    }
}
