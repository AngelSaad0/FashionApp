//
//  Size.swift
//  FashionApp
//
//  Created by Engy on 12/7/24.
//

import Foundation
import UIKit

enum Size: CGFloat {
    case extraSmall = 12
    case small = 14
    case medium = 16
    case large = 18
    case extraLarge = 24
    case extraExtraLarge = 32
    case xxLarge = 36
    case xxxLarge = 48
    case xxxxLarge = 60
    case xxxxxLarge = 72
    case xxxxxxLarge = 84

    var xFactor: CGFloat {
        return CGFloat(self.rawValue) * iPhoneXFactor
    }
}


