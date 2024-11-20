//
//  Category.swift
//  FashionApp
//
//  Created by Engy on 11/20/24.
//

import Foundation

enum Category:String,CaseIterable {
    case Hoodies
    case Shorts
    case Shoes
    case Bag
    case Accessories
    var details: (title: CatagoryTitle, icon: Assets) {
        switch self {
        case .Hoodies:
            return(.Hoodies, .Hoodies)
        case .Shorts:
            return(.Shorts, .Shorts)
        case .Shoes:
            return(.Shoes, .Shoes)
        case .Bag:
            return(.Bag, .Bag)
        case .Accessories:
            return(.Accessories, .Accessories)
        @unknown default : break

        }
    }
}
