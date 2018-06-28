//
//  UICollectionView.swift
//  ReactiveBind
//
//  Created by Nader Besada on 2018-06-26.
//  Copyright © 2018 Nader Besada. All rights reserved.
//

import UIKit

public extension Reactive where Base: UICollectionView {
    
    /// ReactiveEvent of type [T] that corresponds to UICollectionView's reload
    
    public func reload<T>() -> ReactiveEvent<[T]> {
        return ReactiveEvent<[T]>(
            onSet: { _ in self.base.reloadData() }
        )
    }
}

