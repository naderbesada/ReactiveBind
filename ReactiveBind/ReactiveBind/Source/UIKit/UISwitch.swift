//
//  UISwitch.swift
//  ReactiveBind
//
//  Created by Nader Besada on 2018-06-26.
//  Copyright © 2018 Nader Besada. All rights reserved.
//

import UIKit

public extension Reactive where Base: UISwitch {
    
    /// ReactiveControlEvent of type Bool that corresponds to UISwitch's isOn
    
    public var isOn: ReactiveControlEvent<Bool> {
        return ReactiveControlEvent<Bool>(
            self.base,
            controlEvent: ValueEvents.valueChanged,
            onSet: { self.base.isOn = $0 },
            onListen: { return self.base.isOn }
        )
    }
}
