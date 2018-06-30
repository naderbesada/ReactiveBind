//
//  UIActivityIndicator.swift
//  ReactiveBind
//
//  Created by Nader Besada on 2018-06-27.
//  Copyright © 2018 Nader Besada. All rights reserved.
//

import UIKit

public extension Reactive where Base: UIActivityIndicatorView {
    
    /// ReactiveEvent of type Bool that corresponds to UIActivityIndicatorView's animate
    
    public var isAnimating: ReactiveEvent<Bool> {
        return ReactiveEvent<Bool>(
            onSet: { $0 ? self.base.startAnimating() : self.base.stopAnimating() }
        )
    }
}
