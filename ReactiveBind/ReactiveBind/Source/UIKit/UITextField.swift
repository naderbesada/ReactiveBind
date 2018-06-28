//
//  UITextField.swift
//  ReactiveBind
//
//  Created by Nader Besada on 2018-06-26.
//  Copyright © 2018 Nader Besada. All rights reserved.
//

import UIKit

public extension Reactive where Base: UITextField {
    
    /// ReactiveControlEvent of type String that corresponds to UITextField's text
    
    public var text: ReactiveControlEvent<String> {
        return ReactiveControlEvent<String>(
            self.base,
            controlEvent: TextEvents.textDidChange,
            onSet: { self.base.text = $0 },
            onListen: { return self.base.text ?? "" }
        )
    }
    
    /**
     ReactiveControlEvent of type String that corresponds to UITextField's formatted text
     
     - parameters:
        - format: Formated string
     
     - returns:
     ReactiveControlEvent<String>
    */
    
    public func formatText(_ format: String) -> ReactiveControlEvent<String> {
        return ReactiveControlEvent<String>(
            self.base,
            controlEvent: TextEvents.textDidChange,
            onSet: { self.base.text = String(format: format, $0) },
            onListen: { return self.base.text ?? "" }
        )
    }
}
