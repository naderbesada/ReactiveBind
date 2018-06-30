//
//  UISlider.swift
//  ReactiveBind
//
//  Created by Nader Besada on 2018-06-26.
//  Copyright © 2018 Nader Besada. All rights reserved.
//

import UIKit

public extension Reactive where Base: UISlider {
    
    /// ReactiveControlEvent of type Float that corresponds to UISlider's value

    public var value: ReactiveControlEvent<Float> {
        return ReactiveControlEvent<Float>(
            self.base,
            controlEvent: ValueEvents.valueChanged,
            onSet: { self.base.value = $0 },
            onListen: { return self.base.value }
        )        
    }
}
