//
//  HomeHeaderModel.swift
//  FashionApp
//
//  Created by Engy on 11/16/24.
//

import Foundation

struct HomeHeaderModel {
    let title: HomeSectionType
    let action: ()->()
}
enum HomeSectionType: String {
    case categories = "Categories"
    case topSelling = "Top Selling"
    case newIn = "New In"

}
