//
//  OrdersModel.swift
//  FashionApp
//
//  Created by Engy on 11/16/24.
//


import Foundation

struct OrdersModel {
    let id: Int
    let orderNumber: Int
    let orderCount: Int
    let phoneNumber: String
    let address: String
    let orderDate: String
    let status: Status
}

let dummyOrders: [OrdersModel] = [
    OrdersModel(id: 1, orderNumber: 101, orderCount: 3, phoneNumber: "+1-234-567-890", address: "1234 Elm St, Springfield, East", orderDate: "12/06/24", status: .Shipped),
    OrdersModel(id: 2, orderNumber: 102, orderCount: 1, phoneNumber: "+1-234-567-891", address: "5678 Oak Ave, Madison, North", orderDate: "12/06/24", status: .Processing),
    OrdersModel(id: 3, orderNumber: 103, orderCount: 2, phoneNumber: "+1-234-567-892", address: "9101 Pine Rd, Austin, Central", orderDate: "12/06/24", status: .Delivered),
    OrdersModel(id: 4, orderNumber: 104, orderCount: 5, phoneNumber: "+1-234-567-893", address: "1112 Maple Blvd, Seattle, West", orderDate: "12/06/24", status: .Shipped),
    OrdersModel(id: 5, orderNumber: 105, orderCount: 4, phoneNumber: "+1-234-567-894", address: "1314 Birch Ln, Denver, Mountain", orderDate: "12/06/24", status: .Processing),
    OrdersModel(id: 6, orderNumber: 106, orderCount: 3, phoneNumber: "+1-234-567-895", address: "1516 Cedar Dr, Portland, Northwest", orderDate: "12/06/24", status: .Delivered),
    OrdersModel(id: 7, orderNumber: 107, orderCount: 2, phoneNumber: "+1-234-567-896", address: "1718 Willow Ct, Miami, South", orderDate: "12/06/24", status: .Shipped),
    OrdersModel(id: 8, orderNumber: 108, orderCount: 1, phoneNumber: "+1-234-567-897", address: "1920 Spruce Ln, Boston, East", orderDate: "12/06/24", status: .Processing),
    OrdersModel(id: 9, orderNumber: 109, orderCount: 6, phoneNumber: "+1-234-567-898", address: "2122 Redwood Blvd, Atlanta, Southeast", orderDate: "12/06/24", status: .Delivered),
    OrdersModel(id: 10, orderNumber: 110, orderCount: 3, phoneNumber: "+1-234-567-899", address: "2324 Ash Dr, San Jose, West", orderDate: "12/06/24", status: .Processing),
    OrdersModel(id: 11, orderNumber: 111, orderCount: 2, phoneNumber: "+1-234-567-900", address: "2435 Cedarwood Rd, Dallas, Central", orderDate: "12/06/24", status: .Shipped),
    OrdersModel(id: 12, orderNumber: 112, orderCount: 4, phoneNumber: "+1-234-567-901", address: "2550 Willow Run, San Francisco, West", orderDate: "12/06/24", status: .Processing),
    OrdersModel(id: 13, orderNumber: 113, orderCount: 5, phoneNumber: "+1-234-567-902", address: "2675 Oak Grove Ln, New York, North", orderDate: "12/06/24", status: .Delivered),
    OrdersModel(id: 14, orderNumber: 114, orderCount: 3, phoneNumber: "+1-234-567-903", address: "2790 Birch Hill Rd, Chicago, East", orderDate: "12/06/24", status: .Shipped),
    OrdersModel(id: 15, orderNumber: 115, orderCount: 1, phoneNumber: "+1-234-567-904", address: "2921 Maple Ave, Los Angeles, South", orderDate: "12/06/24", status: .Processing),
    OrdersModel(id: 16, orderNumber: 116, orderCount: 2, phoneNumber: "+1-234-567-905", address: "3015 Elmwood Dr, Phoenix, Mountain", orderDate: "12/06/24", status: .Delivered),
    OrdersModel(id: 17, orderNumber: 117, orderCount: 6, phoneNumber: "+1-234-567-906", address: "3130 Pine St, Seattle, Northwest", orderDate: "12/06/24", status: .Shipped),
    OrdersModel(id: 18, orderNumber: 118, orderCount: 4, phoneNumber: "+1-234-567-907", address: "3250 Redwood Blvd, Portland, Northwest", orderDate: "12/06/24", status: .Processing),
    OrdersModel(id: 19, orderNumber: 119, orderCount: 3, phoneNumber: "+1-234-567-908", address: "3380 Ash Cir, Miami, South", orderDate: "12/06/24", status: .Delivered),
    OrdersModel(id: 20, orderNumber: 120, orderCount: 5, phoneNumber: "+1-234-567-909", address: "3500 Cedar Blvd, Atlanta, Southeast", orderDate: "12/06/24", status: .Shipped)
]

