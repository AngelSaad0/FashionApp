//
//  CategoryModel.swift
//  FashionApp
//
//  Created by Engy on 11/15/24.
//

import UIKit

struct CategoryModel {
    let title: String
    let image: String
}

let notivationDummyData = [
    CategoryModel(title: "Gilbert, you placed and order check your order history for full details", image: "notification"),
    CategoryModel(title: "Gilbert, Thank you for shopping with us we have canceled order #24568.", image: "notificationbing"),
    CategoryModel(title: "Gilbert, your Order #24568 has been  confirmed check  your order history for full details", image: "notificationbing"),
    CategoryModel(title: "Gilbert, you placed and order check your order history for full details", image: "notificationbing"),

]

let fillerSearch = [
    CategoryModel(title: "0", image: "filter"),
    CategoryModel(title: "On Sale", image: "arrowdown"),
    CategoryModel(title: "Price", image: "arrowdown"),
    CategoryModel(title: "Sort by", image: "arrowdown"),
    CategoryModel(title: "Men", image: "arrowdown"),
]

