//
//  Gender.swift
//  FashionApp
//
//  Created by Engy on 11/20/24.
//

import Foundation

enum Gender: String,CaseIterable {
    case woman = "Woman"
    case man = "Man"
    case kids = "Kids"
    case all = "All"
}
enum SortBy: String, CaseIterable {
    case recommended = "Recommended"
    case newest = "Newest"
    case lowestToHighestPrice = "Lowest - Highest Price"
    case highestToLowestPrice = "Highest - Lowest Price"
}

enum Deals: String, CaseIterable {
    case onSale = "On Sale"
    case freeShipping = "Free Shipping Eligible"
}

enum Price: String, CaseIterable {
    case min = "Min"
    case max = "Max"
}




