//
//  Response Type .swift
//  FashionApp
//
//  Created by Engy on 11/22/24.
//

import Foundation
struct GraphQLResponse: Codable {
    let data: GraphQLData
}


struct GraphQLData: Codable {
    let customers: CustomerConnection?
    let customer: Customer?
}

struct CustomerConnection: Codable {
    let edges: [CustomerEdge]
}

struct CustomerEdge: Codable {
    let node: Customer
}

struct Customer: Codable {
    let id: String
    let email: String
    let firstName: String?
    let lastName: String?
    let phone: String?
    let tags: [String]?
    let addresses: AddressConnection?
}

struct AddressConnection: Codable {
    let edges: [AddressEdge]
}

struct AddressEdge: Codable {
    let node: Address
}

struct Address: Codable {
    let address1: String
    let city: String
    let country: String
}

