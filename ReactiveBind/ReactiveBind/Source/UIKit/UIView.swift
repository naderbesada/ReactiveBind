//
//  UIView.swift
//  ReactiveBind
//
//  Created by Nader Besada on 2018-06-26.
//  Copyright © 2018 Nader Besada. All rights reserved.
//

import UIKit

public extension Reactive where Base: UIView {
    
    /// ReactiveEvent of type Bool that corresponds to UIView's isHidden
    
    public var isHidden: ReactiveEvent<Bool> {
        return ReactiveEvent<Bool>(
            onSet: { self.base.isHidden = $0 }
        )
    }
}
