//
//  UIImageView.swift
//  ReactiveBind
//
//  Created by Nader Besada on 2018-06-26.
//  Copyright © 2018 Nader Besada. All rights reserved.
//

import UIKit

public extension Reactive where Base: UIImageView {
    
    /// ReactiveEvent of type String corresponds to UIImageView's image name

    public var imageName: ReactiveEvent<String> {
        return ReactiveEvent<String>(
            onSet: { self.base.image = UIImage(named: $0) }
        )
    }
    
    /// ReactiveEvent of type String that corresponds to UIImageView's image url
    
    public var imageUrl: ReactiveEvent<String> {
        return ReactiveEvent<String>(
            onSet: { self.base.image(with: $0) }
        )        
    }
}
