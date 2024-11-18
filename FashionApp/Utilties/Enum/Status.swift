//
//  Status.swift
//  FashionApp
//
//  Created by Engy on 11/17/24.
//

import Foundation
enum Status: String {
    case Processing = "Processing"
    case Delivered = "Delivered"
    case Shipped = "Shipped"
    case Confirmed = "Order Confirmed"
    case Placed = "Order Placed"
    case Returned = "Returned"
    case Cancelled = "Cancelled"

    var timeline:Int {
        switch self {
        case .Delivered:
            return 3
        case .Shipped:
            return 2
        case .Confirmed:
            return 1
        case .Placed:
            return 0
        default : return -1
        }
    }


}

