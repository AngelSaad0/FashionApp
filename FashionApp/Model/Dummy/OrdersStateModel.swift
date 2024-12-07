//
//  OrdersStateModel.swift
//  FashionApp
//
//  Created by Engy on 11/16/24.
//

import Foundation
struct OrdersStateModel {
    var state: Bool
    let stateTitle: Status
}


let dummyOrderStates: [OrdersStateModel] = [
    OrdersStateModel(state: true, stateTitle: .Processing),
    OrdersStateModel(state: false, stateTitle: .Delivered),
    OrdersStateModel(state: true, stateTitle: .Shipped),
    OrdersStateModel(state: false, stateTitle: .Confirmed),
    OrdersStateModel(state: true, stateTitle: .Placed),
    OrdersStateModel(state: false, stateTitle: .Returned),
    OrdersStateModel(state: true, stateTitle: .Cancelled),
    OrdersStateModel(state: false, stateTitle: .Processing),
    OrdersStateModel(state: true, stateTitle: .Delivered),
    OrdersStateModel(state: false, stateTitle: .Shipped)
]
var statuses = [
    OrdersStateModel(state: true, stateTitle: .Processing),
    OrdersStateModel(state: false, stateTitle: .Shipped),
    OrdersStateModel(state: false, stateTitle: .Delivered),
    OrdersStateModel(state: false, stateTitle: .Returned),
    OrdersStateModel(state: false, stateTitle: .Cancelled),
]


