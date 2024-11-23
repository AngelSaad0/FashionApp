//
//  ShopifyAPI.swift
//  FashionApp
//
//  Created by Engy on 11/21/24.
//

import Foundation
import Alamofire

enum ShopifyAPI {
    private static let storeURL = "https://nciost4.myshopify.com/admin/api/2024-07/graphql.json"
    private static let accessToken = "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"

    // Different GraphQL Queries/Mutations
    case getSmartCollections
    case getProducts
    case getProduct(id: String)
    case getOrders
    case getOrder(id: String)
    case getCustomers
    case getCustomer(id: String)
    case getCustomerByEmail(email: String)
    case createDraftOrder(input: String)
    case updateCustomerAddress(addressID: String, customerID: String, input: String)
    case deleteDraftOrder(id: String)

    var graphqlQuery: String {
        switch self {
        case .getSmartCollections:
            return """
            query {
                smartCollections(first: 10) {
                    edges {
                        node {
                            id
                            title
                            productsCount
                        }
                    }
                }
            }
            """
        case .getProducts:
            return """
            query {
                products(first: 10) {
                    edges {
                        node {
                            id
                            title
                            description
                            images(first: 1) {
                                edges {
                                    node {
                                        src
                                    }
                                }
                            }
                        }
                    }
                }
            }
            """
        case .getProduct(let id):
            return """
            query {
                product(id: "\(id)") {
                    id
                    title
                    description
                    images(first: 5) {
                        edges {
                            node {
                                src
                            }
                        }
                    }
                }
            }
            """
        case .getOrders:
            return """
            query {
                orders(first: 10) {
                    edges {
                        node {
                            id
                            name
                            totalPriceSet {
                                presentmentMoney {
                                    amount
                                    currencyCode
                                }
                            }
                        }
                    }
                }
            }
            """
        case .getOrder(let id):
            return """
            query {
                order(id: "\(id)") {
                    id
                    name
                    totalPriceSet {
                        presentmentMoney {
                            amount
                            currencyCode
                        }
                    }
                }
            }
            """
        case .getCustomers:
            return """
            query {
                customers(first: 10) {
                    edges {
                        node {
                            id
                            firstName
                            lastName
                            email
                        }
                    }
                }
            }
            """
        case .getCustomer(let id):
            return """
            query {
                customer(id: "\(id)") {
                    id
                    firstName
                    lastName
                    email
                    phone
                    tags
                }
            }
            """
        case .getCustomerByEmail(let email):
            return """
            query {
                customers(query: "email:\(email)", first: 1) {
                    edges {
                        node {
                            id
                            firstName
                            lastName
                            email
                            phone
                            tags
                        }
                    }
                }
            }
            """
        case .createDraftOrder(let input):
            return """
            mutation {
                draftOrderCreate(input: \(input)) {
                    draftOrder {
                        id
                        name
                    }
                    userErrors {
                        field
                        message
                    }
                }
            }
            """
        case .updateCustomerAddress(let addressID, let customerID, let input):
            return """
            mutation {
                customerAddressUpdate(id: "\(addressID)", customerId: "\(customerID)", input: \(input)) {
                    customerAddress {
                        id
                    }
                    userErrors {
                        field
                        message
                    }
                }
            }
            """
        case .deleteDraftOrder(let id):
            return """
            mutation {
                draftOrderDelete(id: "\(id)") {
                    deletedId
                    userErrors {
                        field
                        message
                    }
                }
            }
            """
        }
    }

    func shopifyGraphQLURL() -> String {
        return "\(ShopifyAPI.storeURL)"
    }

    var headers: HTTPHeaders {
        return [
            "Content-Type": "application/json",
            "X-Shopify-Access-Token": "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",
        ]
    }
}
