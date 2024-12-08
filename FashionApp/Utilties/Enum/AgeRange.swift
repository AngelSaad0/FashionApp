//
//  AgeRange.swift
//  FashionApp
//
//  Created by Engy on 12/8/24.
//

import Foundation

enum AgeRange: String, CaseIterable {
    case Under18
    case range18_24 = "18-24"
    case range25_34 = "25-34"
    case range35_44 = "35-44"
    case range45_54 = "45-54"
    case rangeOver55 = "55+"
    case range65_74 = "65-74"
    case rangeOver75 = "75+"
    case unSpicfied = ""

    var localized: String {
        return self.rawValue.localized
    }

    static var localizedOptions: [String] {
        return self.allCases.map { $0.localized }
    }
}

