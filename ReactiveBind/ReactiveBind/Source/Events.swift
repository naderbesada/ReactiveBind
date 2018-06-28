//
//  Events.swift
//  ReactiveBind
//
//  Created by Nader Besada on 2018-06-26.
//  Copyright © 2018 Nader Besada. All rights reserved.
//

import UIKit

protocol Event {
    var event: UIControlEvents { get }
}

public enum TextEvents: Event {
    case textDidChange
    case didBeginEditing
    
    var event: UIControlEvents {
        switch self {
        case .textDidChange:
            return .editingChanged
        case .didBeginEditing:
            return .editingDidBegin
        }
    }
}

public enum ButtonEvents: Event {
    case buttonTapped
    case touchDragged
    
    var event: UIControlEvents {
        switch self {
        case .buttonTapped:
            return .touchUpInside
        case .touchDragged:
            return .touchDragOutside
        }
    }
}

public enum ValueEvents: Event {
    case valueChanged
    
    var event: UIControlEvents {
        switch self {
        case .valueChanged:
            return .valueChanged
        }
    }
}
