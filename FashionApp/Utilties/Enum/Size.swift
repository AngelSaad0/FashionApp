//
//  Size.swift
//  FashionApp
//
//  Created by Engy on 12/7/24.
//

import Foundation
import UIKit

enum Size: CGFloat {
    case size5 = 5
    case size10 = 10
    case size11 = 11
    case size12 = 12
    case size13 = 13
    case size14 = 14
    case size15 = 15
    case size16 = 16
    case size17 = 17
    case size18 = 18
    case size19 = 19
    case size20 = 20
    case size21 = 21
    case size22 = 22
    case size23 = 23
    case size24 = 24
    case size25 = 25
    case size26 = 26
    case size27 = 27
    case size28 = 28
    case size29 = 29
    case size30 = 30
    case size31 = 31
    case size32 = 32



    var xFactor: CGFloat {
        return CGFloat(self.rawValue) * iPhoneXFactor
    }
}


