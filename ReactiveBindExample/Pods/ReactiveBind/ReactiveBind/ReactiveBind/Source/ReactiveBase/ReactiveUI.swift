//
//  ReactiveUI.swift
//  BlurryCamera
//
//  Created by Nader Besada on 2018-06-01.
//  Copyright © 2018 Nader Besada. All rights reserved.
//

import UIKit

public protocol ReactiveUI: class {
    associatedtype UIType: ReactiveUI
    var rb: Reactive<UIType> { get }
}

public extension ReactiveUI where Self: ReactiveUI {
    
    /// Access ReactiveBind
    
    public var rb: Reactive<Self> {
        return Reactive<Self>(base: self)
    }
}

extension UITextField: ReactiveUI { public typealias UIType = UITextField }

extension UILabel: ReactiveUI { public typealias UIType = UILabel }

extension UIImageView: ReactiveUI { public typealias UIType = UIImageView }

extension UISlider: ReactiveUI { public typealias UIType = UISlider }

extension UIActivityIndicatorView: ReactiveUI { public typealias UIType = UIActivityIndicatorView }

extension UICollectionView: ReactiveUI { public typealias UIType = UICollectionView }

extension UIButton: ReactiveUI { public typealias UIType = UIButton }

extension UISwitch: ReactiveUI { public typealias UIType = UISwitch }


