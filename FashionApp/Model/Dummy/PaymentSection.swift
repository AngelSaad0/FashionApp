//
//  PaymentSection.swift
//  FashionApp
//
//  Created by Engy on 11/18/24.
//

import Foundation
struct PaymentSection {
    let title: String
    let items: [String]
    let icons: [String] 
}
let  paymentDummyData = [
    PaymentSection(
        title: "Cards",
        items: ["**** 4187", "**** 9387"],
        icons: ["payment", "payment"]
    ),
    PaymentSection(
        title: "Paypal",
        items: ["Cloth@gmail.com"],
        icons: ["paypal_default"]
    )
]

