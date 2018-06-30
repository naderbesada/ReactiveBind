//
//  CellViewModel.swift
//  ReactiveBindExample
//
//  Created by Nader Besada on 2018-06-29.
//  Copyright © 2018 Nader Besada. All rights reserved.
//

import Foundation
import ReactiveBind

class CellViewModel: ViewModelDelegate {
    let text = Observable("Hello")
}
