//
//  TopSellingModel.swift
//  FashionApp
//
//  Created by Engy on 11/15/24.
//
import UIKit
struct Products {
    let title: String
    let price: String
    let image: String
    let colors: [String]
    let sizes: [String]
    let description: String
    let reviews: [Review]
    var quantity: Int = 1
    let rating: Double?
}
struct Review {
    let username: String
    let userimage : String
    let rating: Int
    let comment: String
}


let productsList: [Products] = [
    Products(
        title: "Men's Harrington Jacket",
        price: "148.00",
        image: "topsell1",
        colors: ["Lemon", "Navy", "Black"],
        sizes: ["S", "M", "L", "XL"],
        description: "Built for life and made to last, this Harrington jacket is part of our premium collection. It features a lightweight design with a timeless look, making it perfect for any season. The durable material ensures long-lasting wear.",
        reviews: [
            Review(username: "JohnD", userimage: "user1", rating: 5, comment: "Great quality and fit!"),
            Review(username: "StyleGuru88", userimage: "user2", rating: 4, comment: "Stylish and comfortable, but slightly overpriced.")
        ],
        quantity: 10,
        rating: 5
    ),

    Products(
        title: "Unisex Hoodie",
        price: "18.00",
        image: "topsell3",
        colors: ["Black", "Red", "Green"],
        sizes: ["M", "L", "XL", "XXL"],
        description: "Soft, cozy, and stylish, this unisex hoodie offers the ultimate casual comfort. Perfect for lounging or stepping out in style.",
        reviews: [
            Review(username: "Ahmed", userimage: "user4", rating: 5, comment: "Super comfy and warm!"),
            Review(username: "Eman", userimage: "user5", rating: 4, comment: "Nice hoodie but wish it had more colors.")
        ],
        quantity: 15,
        rating: 5
    ),
    Products(
        title: "Leather Wallet",
        price: "349.00",
        image: "topsell4",
        colors: ["Brown", "Black"],
        sizes: ["One Size"],
        description: "Crafted from premium leather, this wallet combines elegance and functionality. Multiple compartments make it perfect for organizing your cards and cash.",
        reviews: [
            Review(username: "LuxuryLife", userimage: "user6", rating: 5, comment: "Amazing quality and stylish design."),
            Review(username: "PracticalUser", userimage: "user7", rating: 4, comment: "Durable but a bit expensive.")
        ],
        quantity: 8,
        rating: 4
    ),
    Products(
        title: "Classic Cap",
        price: "50.00",
        image: "topsell5",
        colors: ["Navy Blue", "Black", "Red"],
        sizes: ["Adjustable"],
        description: "A timeless accessory for every wardrobe, this classic cap is designed for comfort and style. Its adjustable strap ensures a perfect fit for all.",
        reviews: [
            Review(username: "CapCollector", userimage: "user8", rating: 5, comment: "Love the fit and color options."),
            Review(username: "OutdoorFan", userimage: "user9", rating: 4, comment: "Great for sunny days.")
        ],
        quantity: 20,
        rating: 4
    ),
    Products(
        title: "Women's Scarf",
        price: "25.00",
        image: "topsell6",
        colors: ["Pink", "Beige", "Grey"],
        sizes: ["One Size"],
        description: "Soft and lightweight, this scarf is perfect for adding a touch of elegance to any outfit.",
        reviews: [
            Review(username: "Fashionista", userimage: "user1", rating: 5, comment: "Beautiful and versatile!"),
            Review(username: "AnnaW", userimage: "user2", rating: 4, comment: "Nice scarf but could be a bit longer.")
        ],
        quantity: 18,
        rating: 4
    ),
    Products(
        title: "Men's Leather Boots",
        price: "199.00",
        image:"topsell7",
        colors: ["Brown", "Black"],
        sizes: ["8", "9", "10", "11"],
        description: "Stylish and durable, these leather boots are perfect for both casual and formal occasions.",
        reviews: [
            Review(username: "BootLover", userimage: "user3", rating: 5, comment: "Great craftsmanship and comfort."),
            Review(username: "MikeT", userimage: "user4", rating: 4, comment: "Fits well but takes time to break in.")
        ],
        quantity: 12,
        rating: 4
    ),
    Products(
        title: "Women's Handbag",
        price: "180.00",
        image:"topsell1",
        colors: ["Black", "Brown", "Beige"],
        sizes: ["One Size"],
        description: "This stylish handbag is designed for elegance and practicality, making it perfect for everyday use.",
        reviews: [
            Review(username: "BagLover", userimage: "user8", rating: 5, comment: "Great design and spacious!"),
            Review(username: "SophiaT", userimage: "user1", rating: 4, comment: "Nice handbag but straps feel a bit thin.")
        ],
        quantity: 10,
        rating: 5
    ),
    Products(
        title: "Wireless Earbuds",
        price: "99.00",
        image:"topsell8",
        colors: ["Black", "White"],
        sizes: ["One Size"],
        description: "Experience true wireless freedom with these high-quality earbuds featuring exceptional sound clarity.",
        reviews: [
            Review(username: "MusicLover", userimage: "user5", rating: 5, comment: "Excellent sound quality and battery life."),
            Review(username: "Techie23", userimage: "user6", rating: 4, comment: "Great earbuds but case feels flimsy.")
        ],
        quantity: 30,
        rating: 5
    ),
    Products(
        title: "Men's Watch",
        price: "250.00",
        image:"topsell9",
        colors: ["Silver", "Gold"],
        sizes: ["One Size"],
        description: "This elegant watch combines modern design with traditional craftsmanship for a timeless accessory.",
        reviews: [
            Review(username: "TimeKeeper", userimage: "user6", rating: 5, comment: "Looks classy and works perfectly."),
            Review(username: "SamM", userimage: "user7", rating: 4, comment: "Beautiful watch but a bit heavy.")
        ],
        quantity: 5,
        rating: 4
    ),
    Products(
        title: "Women's Handbag",
        price: "180.00",
        image:"topsell1",
        colors: ["Black", "Brown", "Beige"],
        sizes: ["One Size"],
        description: "This stylish handbag is designed for elegance and practicality, making it perfect for everyday use.",
        reviews: [
            Review(username: "BagLover", userimage: "user8", rating: 5, comment: "Great design and spacious!"),
            Review(username: "SophiaT", userimage: "user1", rating: 4, comment: "Nice handbag but straps feel a bit thin.")
        ],
        quantity: 10,
        rating: 5
    )
]


let dummyAddresses = [
   "2715 Ash Dr. San Jose, South Dakota 83475",
   "123 Elm St. Springfield, Illinois 62704",
   "456 Oak St. Denver, Colorado 80220",
   "789 Maple Ave. Austin, Texas 78701",
   "101 Pine Rd. Boston, Massachusetts 02110",
   "202 Birch Blvd. Seattle, Washington 98109",
   "303 Cedar Ln. Miami, Florida 33101",
   "404 Walnut Way. Phoenix, Arizona 85001",
   "505 Cherry Ct. Dallas, Texas 75201",
   "606 Willow Dr. Chicago, Illinois 60605",
   "707 Poplar Pl. Atlanta, Georgia 30301",
   "808 Spruce Ln. Nashville, Tennessee 37201",
   "909 Aspen Rd. New York, New York 10001",
   "1001 Fir Dr. Los Angeles, California 90001",
   "1112 Redwood St. San Francisco, California 94101",
   "1213 Magnolia Blvd. Portland, Oregon 97201",
   "1314 Sycamore Ln. Houston, Texas 77001",
   "1415 Hickory St. Orlando, Florida 32801",
   "1516 Alder Rd. Las Vegas, Nevada 89101",
   "1617 Juniper Ave. Salt Lake City, Utah 84101"
]




var statuses = [
    OrdersStateModel(state: true, stateTitle: .Processing),
    OrdersStateModel(state: false, stateTitle: .Shipped),
    OrdersStateModel(state: false, stateTitle: .Delivered),
    OrdersStateModel(state: false, stateTitle: .Returned),
    OrdersStateModel(state: false, stateTitle: .Cancelled),
]

let orders = [
    OrdersModel(
        id: 456765,
        orderNumber: 1001,
        orderCount: 4,
        phoneNumber: "1234567890",
        address: "123 Main Street, City Center",
        orderDate: "2024-11-12",
        status: .Placed
    ),
    OrdersModel(
        id: 959765,
        orderNumber: 1002,
        orderCount: 1,
        phoneNumber: "9876543210",
        address: "456 Avenue, Suburb",
        orderDate: "2024-11-12",
        status: .Confirmed
    ),
    OrdersModel(
        id: 856765,
        orderNumber: 1003,
        orderCount: 5,
        phoneNumber: "5555555555",
        address: "789 Boulevard, Uptown",
        orderDate: "2024-11-12",
        status: .Shipped
    ),
    OrdersModel(
        id: 756765,
        orderNumber: 1004,
        orderCount: 1,
        phoneNumber: "1111111111",
        address: "321 Road, Downtown",
        orderDate: "2024-11-12",
        status: .Delivered
    ),
    OrdersModel(
        id: 656765,
        orderNumber: 1005,
        orderCount: 4,
        phoneNumber: "2222222222",
        address: "654 Lane, Countryside",
        orderDate: "2024-11-12",
        status: .Returned
    ),
//            OrdersModel(
//                id: 546765,
//                orderNumber: 1006,
//                orderCount: 3,
//                phoneNumber: "3333333333",
//                address: "987 Street, Seaside",
//                orderDate: "2024-11-12",
//                status: .Cancelled
//            ),
    OrdersModel(
        id: 436765,
        orderNumber: 1007,
        orderCount: 2,
        phoneNumber: "4444444444",
        address: "159 High Street, City Center",
        orderDate: "2024-11-12",
        status: .Placed
    ),
    OrdersModel(
        id: 326765,
        orderNumber: 1008,
        orderCount: 6,
        phoneNumber: "5555555555",
        address: "753 Hill Road, Uptown",
        orderDate: "2024-11-12",
        status: .Shipped
    ),
    OrdersModel(
        id: 216765,
        orderNumber: 1009,
        orderCount: 1,
        phoneNumber: "6666666666",
        address: "852 Valley Street, Suburb",
        orderDate: "2024-11-12",
        status: .Delivered
    ),
    OrdersModel(
        id: 106765,
        orderNumber: 1010,
        orderCount: 3,
        phoneNumber: "7777777777",
        address: "951 Sunset Avenue, Countryside",
        orderDate: "2024-11-12",
        status: .Confirmed
    ),
    OrdersModel(
        id: 986765,
        orderNumber: 1011,
        orderCount: 2,
        phoneNumber: "8888888888",
        address: "369 Forest Lane, Mountainside",
        orderDate: "2024-11-12",
        status: .Returned
    ),
//            OrdersModel(
//                id: 876765,
//                orderNumber: 1012,
//                orderCount: 5,
//                phoneNumber: "9999999999",
//                address: "147 River Road, Lakeside",
//                orderDate: "2024-11-12",
//                status: .Cancelled
//            )
]

