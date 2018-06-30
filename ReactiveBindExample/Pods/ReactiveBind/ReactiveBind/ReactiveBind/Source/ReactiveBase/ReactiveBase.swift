//
//  ReactiveBase.swift
//  BlurryCamera
//
//  Created by Nader Besada on 2018-05-30.
//  Copyright © 2018 Nader Besada. All rights reserved.
//

import Foundation
import UIKit

public class Reactive<Base: ReactiveUI> {
    var base: Base
    
    init(base: Base) {
        self.base = base
    }
}
