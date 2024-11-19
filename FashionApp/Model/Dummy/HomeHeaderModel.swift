//
//  HomeHeaderModel.swift
//  FashionApp
//
//  Created by Engy on 11/16/24.
//

import Foundation

struct HomeHeaderModel {
    let title: HeaderNames
    let action: ()->()
}
enum HeaderNames: String {
    case Categories = "Categories"
    case TopSelling = "Top Selling"
    case NewIn = "New In"

}
