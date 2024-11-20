//
//  FilterOption.swift
//  FashionApp
//
//  Created by Engy on 11/20/24.
//
enum FilterOption:CaseIterable {
    case allFillter
    case sortBy
    case gender
    case deals
    case price

    var title: String {
        switch self {
        case .allFillter: return "0"
        case .sortBy: return "Sort by"
        case .gender: return "Gender"
        case .deals: return "Deals"
        case .price: return "Price"
        }
    }
    var icon: Assets {
        switch self {
        case .allFillter: return Assets.filter
        default: return Assets.arrowdown
        }
    }

    var options: [String] {
        switch self {
        case .allFillter: return []
        case .sortBy:
            return SortBy.allCases.map { $0.rawValue }
        case .gender:
            return Gender.allCases.map { $0.rawValue }
        case .deals:
            return Deals.allCases.map { $0.rawValue }
        case .price:
            return Price.allCases.map { $0.rawValue }
        }
    }
}
