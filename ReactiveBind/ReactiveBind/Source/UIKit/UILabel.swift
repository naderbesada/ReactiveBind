//
//  UILabel.swift
//  ReactiveBind
//
//  Created by Nader Besada on 2018-06-26.
//  Copyright © 2018 Nader Besada. All rights reserved.
//

import UIKit

public extension Reactive where Base: UILabel {
    
    /// ReactiveEvent of type String that corresponds to UILabel's text
    
    public var text: ReactiveEvent<String> {
        return ReactiveEvent<String>(
            onSet: { self.base.text = $0 }
        )
    }
}
