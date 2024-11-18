//
//  TopSellingModel.swift
//  FashionApp
//
//  Created by Engy on 11/15/24.
//

import Foundation

struct TopSellingModel {
    let title: String
    let price: String
    let image: String
    let color: String
    let size: String
    var quantity: Int = 1 

    init(title: String, price: String, image: String, color: String = "red", size: String =  "M") {
        self.title = title
        self.price = price
        self.image = image
        self.color = color
        self.size = size
    }

}
