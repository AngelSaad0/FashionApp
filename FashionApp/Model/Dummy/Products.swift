//
//  TopSellingModel.swift
//  FashionApp
//
//  Created by Engy on 11/15/24.
//
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
    let category: String
    let gender: String
}

struct Review {
    let username: String
    let userimage: String
    let rating: Int
    let comment: String
}

let productsList: [Products] = [
    //bags
    Products(
        title: "Classic Tote Bag",
        price: "120.00",
        image: "bag1",
        colors: ["Black", "Brown", "Beige"],
        sizes: ["One Size"],
        description: "A timeless tote bag that offers both style and functionality. Perfect for everyday use, with ample space for all your essentials.",
        reviews: [
            Review(username: "Fashionista", userimage: "user1", rating: 5, comment: "Great design and spacious!"),
            Review(username: "AnnaW", userimage: "user2", rating: 4, comment: "Nice bag but could be a bit larger.")
        ],
        quantity: 10,
        rating: 4.5,
        category: "Accessories",
        gender: "Female"
    ),
    Products(
        title: "Leather Crossbody Bag",
        price: "150.00",
        image: "bag2",
        colors: ["Black", "Brown", "Red"],
        sizes: ["One Size"],
        description: "Elegant and practical, this leather crossbody bag is perfect for a night out or a day at the office.",
        reviews: [
            Review(username: "StyleGuru", userimage: "user3", rating: 5, comment: "Excellent quality and perfect size."),
            Review(username: "SophiaT", userimage: "user4", rating: 4, comment: "Great bag but wish it had more compartments.")
        ],
        quantity: 8,
        rating: 4.7,
        category: "Accessories",
        gender: "Female"
    ),
    Products(
        title: "Backpack with Laptop Sleeve",
        price: "200.00",
        image: "bag3",
        colors: ["Navy Blue", "Black", "Grey"],
        sizes: ["One Size"],
        description: "A versatile backpack featuring a padded laptop sleeve and multiple compartments for organization.",
        reviews: [
            Review(username: "Techie23", userimage: "user5", rating: 5, comment: "Perfect for work and travel!"),
            Review(username: "JohnD", userimage: "user6", rating: 4, comment: "Spacious and functional but could use better quality zippers.")
        ],
        quantity: 12,
        rating: 4.5,
        category: "Accessories",
        gender: "Unisex"
    ),
    Products(
        title: "Small Leather Clutch",
        price: "90.00",
        image: "bag4",
        colors: ["Black", "Red", "Blue"],
        sizes: ["One Size"],
        description: "A sleek and elegant clutch for special occasions. Compact yet spacious enough for essentials.",
        reviews: [
            Review(username: "PartyLover", userimage: "user7", rating: 5, comment: "Perfect for a night out!"),
            Review(username: "Eman", userimage: "user8", rating: 4, comment: "Nice clutch but could be a bit bigger.")
        ],
        quantity: 15,
        rating: 4.8,
        category: "Accessories",
        gender: "Female"
    ),
    Products(
        title: "Canvas Shoulder Bag",
        price: "75.00",
        image: "bag5",
        colors: ["Green", "Beige", "Red"],
        sizes: ["One Size"],
        description: "Casual and durable, this canvas shoulder bag is perfect for weekends or outdoor activities.",
        reviews: [
            Review(username: "AdventureSeeker", userimage: "user9", rating: 5, comment: "Comfortable and practical!"),
            Review(username: "CapCollector", userimage: "user10", rating: 4, comment: "Good size, but could use more pockets.")
        ],
        quantity: 20,
        rating: 4.6,
        category: "Accessories",
        gender: "Unisex"
    ),
    Products(
        title: "Beach Tote Bag",
        price: "50.00",
        image: "bag6",
        colors: ["Blue", "Yellow", "White"],
        sizes: ["One Size"],
        description: "Lightweight and spacious, perfect for a day at the beach. Features a waterproof lining.",
        reviews: [
            Review(username: "SummerLover", userimage: "user11", rating: 5, comment: "Great for beach trips!"),
            Review(username: "OutdoorFan", userimage: "user12", rating: 4, comment: "Nice bag but could use better quality straps.")
        ],
        quantity: 25,
        rating: 4.3,
        category: "Accessories",
        gender: "Female"
    ),
    //watches
        Products(
            title: "Leather Strap Watch",
            price: "150.00",
            image: "watch1",
            colors: ["Black", "Brown", "Tan"],
            sizes: ["One Size"],
            description: "Classic leather strap watch with a minimalist design, perfect for any formal occasion.",
            reviews: [
                Review(username: "WatchLover", userimage: "user1", rating: 5, comment: "Love the elegant design!"),
                Review(username: "SophiaW", userimage: "user2", rating: 4, comment: "Good watch, but wish it was a bit more lightweight.")
            ],
            quantity: 20,
            rating: 4.8,
            category: "Accessories",
            gender: "Unisex"
        ),
        Products(
            title: "Stainless Steel Watch",
            price: "200.00",
            image: "watch2",
            colors: ["Silver", "Gold", "Black"],
            sizes: ["One Size"],
            description: "Sleek stainless steel watch with a sophisticated look. Ideal for both business and casual wear.",
            reviews: [
                Review(username: "BusinessMan", userimage: "user3", rating: 5, comment: "Excellent quality and style!"),
                Review(username: "EmmaJ", userimage: "user4", rating: 4, comment: "Nice watch, but a bit heavy.")
            ],
            quantity: 15,
            rating: 4.7,
            category: "Accessories",
            gender: "Male"
        ),
        Products(
            title: "Digital Sports Watch",
            price: "120.00",
            image: "watch3",
            colors: ["Black", "Blue", "Red"],
            sizes: ["One Size"],
            description: "Durable digital sports watch with a stopwatch and alarm function, perfect for athletes.",
            reviews: [
                Review(username: "Athlete", userimage: "user5", rating: 5, comment: "Great watch for workouts!"),
                Review(username: "FitnessFan", userimage: "user6", rating: 4, comment: "Good watch, but a bit bulky.")
            ],
            quantity: 18,
            rating: 4.5,
            category: "Accessories",
            gender: "Unisex"
        ),
        Products(
            title: "Smartwatch",
            price: "250.00",
            image: "watch4",
            colors: ["Black", "Silver", "Gold"],
            sizes: ["One Size"],
            description: "Advanced smartwatch with fitness tracking, notifications, and a sleek design.",
            reviews: [
                Review(username: "Techie", userimage: "user7", rating: 5, comment: "Love the functionality and design!"),
                Review(username: "SophiaT", userimage: "user8", rating: 4, comment: "Great watch, but could use more battery life.")
            ],
            quantity: 10,
            rating: 4.6,
            category: "Accessories",
            gender: "Unisex"
        ),
        Products(
            title: "Gold Chronograph Watch",
            price: "300.00",
            image: "watch5",
            colors: ["Gold", "Black"],
            sizes: ["One Size"],
            description: "Elegant gold chronograph watch with a polished finish. Perfect for special occasions.",
            reviews: [
                Review(username: "GlamGirl", userimage: "user9", rating: 5, comment: "Stunning watch, a real statement piece!"),
                Review(username: "SophiaA", userimage: "user10", rating: 4, comment: "Beautiful watch, but could be a bit heavier.")
            ],
            quantity: 12,
            rating: 4.7,
            category: "Accessories",
            gender: "Female"
        ),
        Products(
            title: "Skeleton Watch",
            price: "180.00",
            image: "watch6",
            colors: ["Black", "Silver"],
            sizes: ["One Size"],
            description: "Unique skeleton watch with a see-through case revealing the inner mechanics. A true timepiece for watch enthusiasts.",
            reviews: [
                Review(username: "WatchGeek", userimage: "user11", rating: 5, comment: "Amazing craftsmanship!"),
                Review(username: "SophiaW", userimage: "user12", rating: 4, comment: "Nice watch, but could be a bit more affordable.")
            ],
            quantity: 15,
            rating: 4.6,
            category: "Accessories",
            gender: "Unisex"
        ),
    //Sunglasses
        Products(
            title: "Aviator Sunglasses",
            price: "100.00",
            image: "sunglass1",
            colors: ["Black", "Silver", "Gold"],
            sizes: ["One Size"],
            description: "Classic aviator sunglasses with a sleek metal frame and tinted lenses. Perfect for any occasion, whether you're out on the town or at the beach.",
            reviews: [
                Review(username: "StreetStyle", userimage: "user1", rating: 5, comment: "Great sunglasses, they go with everything!"),
                Review(username: "EmmaJ", userimage: "user2", rating: 4, comment: "Nice fit, but could be a bit lighter.")
            ],
            quantity: 20,
            rating: 4.8,
            category: "Accessories",
            gender: "Unisex"
        ),
        Products(
            title: "Round Sunglasses",
            price: "80.00",
            image: "sunglass2",
            colors: ["Black", "Gold", "Tortoise"],
            sizes: ["One Size"],
            description: "Retro round sunglasses with a bold frame and gradient lenses. Perfect for a boho-chic look.",
            reviews: [
                Review(username: "BohoQueen", userimage: "user3", rating: 5, comment: "Love these sunglasses, perfect for summer!"),
                Review(username: "TrendyGal", userimage: "user4", rating: 4, comment: "Great style but wish the lenses were darker.")
            ],
            quantity: 15,
            rating: 4.6,
            category: "Accessories",
            gender: "Female"
        ),
        Products(
            title: "Cat-Eye Sunglasses",
            price: "90.00",
            image: "sunglass3",
            colors: ["Black", "Red", "Leopard"],
            sizes: ["One Size"],
            description: "Elegant cat-eye sunglasses with a retro-inspired frame. Perfect for adding a touch of glamour to any outfit.",
            reviews: [
                Review(username: "GlamGirl", userimage: "user5", rating: 5, comment: "These sunglasses are a statement piece!"),
                Review(username: "SophiaT", userimage: "user6", rating: 4, comment: "Love the style, but the fit could be tighter.")
            ],
            quantity: 18,
            rating: 4.7,
            category: "Accessories",
            gender: "Female"
        ),
        Products(
            title: "Sporty Wrap Sunglasses",
            price: "120.00",
            image: "sunglass4",
            colors: ["Black", "White", "Red"],
            sizes: ["One Size"],
            description: "Durable wrap-around sunglasses with a lightweight frame and polarized lenses. Ideal for sports and outdoor activities.",
            reviews: [
                Review(username: "OutdoorLover", userimage: "user7", rating: 5, comment: "Perfect for running and biking!"),
                Review(username: "AdventureSeeker", userimage: "user8", rating: 4, comment: "Great sunglasses, but could have better ventilation.")
            ],
            quantity: 10,
            rating: 4.4,
            category: "Accessories",
            gender: "Unisex"
        ),
        Products(
            title: "Oversized Sunglasses",
            price: "110.00",
            image: "sunglass5",
            colors: ["Black", "Gold", "Leopard"],
            sizes: ["One Size"],
            description: "Statement oversized sunglasses with a bold frame and tinted lenses. Perfect for adding drama to your outfit.",
            reviews: [
                Review(username: "StyleIcon", userimage: "user9", rating: 5, comment: "Love these sunglasses, they complete my look!"),
                Review(username: "SophiaA", userimage: "user10", rating: 4, comment: "Great style, but could be a bit more lightweight.")
            ],
            quantity: 12,
            rating: 4.5,
            category: "Accessories",
            gender: "Female"
        ),
        Products(
            title: "Polarized Sunglasses",
            price: "95.00",
            image: "sunglass6",
            colors: ["Black", "Gray", "Blue"],
            sizes: ["One Size"],
            description: "High-quality polarized sunglasses with glare reduction technology, perfect for all-day wear.",
            reviews: [
                Review(username: "SunLover", userimage: "user11", rating: 5, comment: "Great for sunny days and long drives!"),
                Review(username: "SophiaT", userimage: "user12", rating: 4, comment: "Nice sunglasses, but could have a better grip.")
            ],
            quantity: 15,
            rating: 4.6,
            category: "Accessories",
            gender: "Unisex"
        ),
    //Dresses
        Products(
            title: "Floral Maxi Dress",
            price: "250.00",
            image: "dress1",
            colors: ["Red", "Blue", "Green"],
            sizes: ["S", "M", "L", "XL"],
            description: "Flowy floral maxi dress with a flattering A-line silhouette. Perfect for summer days or elegant evenings.",
            reviews: [
                Review(username: "SummerChic", userimage: "user1", rating: 5, comment: "Beautiful dress, great for weddings!"),
                Review(username: "SophiaW", userimage: "user2", rating: 4, comment: "Lovely dress, but could be a bit longer.")
            ],
            quantity: 20,
            rating: 4.8,
            category: "Clothing",
            gender: "Female"
        ),
        Products(
            title: "Lace Midi Dress",
            price: "180.00",
            image: "dress2",
            colors: ["White", "Black", "Red"],
            sizes: ["S", "M", "L"],
            description: "Elegant lace midi dress with a fitted bodice and flared skirt. Perfect for cocktail parties and date nights.",
            reviews: [
                Review(username: "DateNight", userimage: "user3", rating: 5, comment: "Absolutely stunning!"),
                Review(username: "SophiaT", userimage: "user4", rating: 4, comment: "Beautiful dress, but could use a lining.")
            ],
            quantity: 15,
            rating: 4.7,
            category: "Clothing",
            gender: "Female"
        ),
        Products(
            title: "Maxi Shirt Dress",
            price: "150.00",
            image: "dress3",
            colors: ["Navy", "White", "Pink"],
            sizes: ["S", "M", "L"],
            description: "Casual yet chic maxi shirt dress with a belted waist and button-up detail. Perfect for daytime outings.",
            reviews: [
                Review(username: "BohoChic", userimage: "user5", rating: 5, comment: "Great dress, perfect for brunch!"),
                Review(username: "TrendyGal", userimage: "user6", rating: 4, comment: "Nice dress, but the belt could be a bit longer.")
            ],
            quantity: 18,
            rating: 4.6,
            category: "Clothing",
            gender: "Female"
        ),
        Products(
            title: "Bodycon Dress",
            price: "200.00",
            image: "dress4",
            colors: ["Black", "Red", "Blue"],
            sizes: ["S", "M", "L"],
            description: "Fitted bodycon dress with a scoop neckline and short sleeves. Ideal for a night out.",
            reviews: [
                Review(username: "NightOut", userimage: "user7", rating: 5, comment: "Love the fit and style!"),
                Review(username: "SophiaW", userimage: "user8", rating: 4, comment: "Great dress, but could be a bit more forgiving.")
            ],
            quantity: 10,
            rating: 4.7,
            category: "Clothing",
            gender: "Female"
        ),
        Products(
            title: "Tulle Wedding Dress",
            price: "350.00",
            image: "dress5",
            colors: ["White", "Ivory", "Blush"],
            sizes: ["S", "M", "L", "XL"],
            description: "Luxurious tulle wedding dress with a strapless bodice and delicate lace details. Perfect for the bride who wants a classic and romantic look.",
            reviews: [
                Review(username: "BrideToBe", userimage: "user9", rating: 5, comment: "Absolutely perfect for my big day!"),
                Review(username: "SophiaA", userimage: "user10", rating: 4, comment: "Beautiful dress, but a bit heavy.")
            ],
            quantity: 12,
            rating: 4.6,
            category: "Clothing",
            gender: "Female"
        ),
        Products(
            title: "Casual Shift Dress",
            price: "120.00",
            image: "dress6",
            colors: ["Gray", "Black", "Blue"],
            sizes: ["S", "M", "L"],
            description: "Simple and comfortable casual shift dress with a loose fit and short sleeves. Ideal for everyday wear.",
            reviews: [
                Review(username: "EverydayFashion", userimage: "user11", rating: 5, comment: "Perfect for casual days!"),
                Review(username: "SophiaT", userimage: "user12", rating: 4, comment: "Nice dress, but could be a bit longer.")
            ],
            quantity: 15,
            rating: 4.5,
            category: "Clothing",
            gender: "Female"
        ),
    //Jackets
        Products(
            title: "Leather Bomber Jacket",
            price: "350.00",
            image: "jacket1",
            colors: ["Black", "Brown", "Tan"],
            sizes: ["S", "M", "L", "XL"],
            description: "Classic leather bomber jacket with ribbed cuffs and a sleek design. Perfect for both casual and formal outings.",
            reviews: [
                Review(username: "StreetStyle", userimage: "user1", rating: 5, comment: "Great quality and style!"),
                Review(username: "EmmaJ", userimage: "user2", rating: 4, comment: "Nice jacket, but could be a bit more affordable.")
            ],
            quantity: 20,
            rating: 4.8,
            category: "Outerwear",
            gender: "Male"
        ),
        Products(
            title: "Denim Jacket",
            price: "120.00",
            image: "jacket2",
            colors: ["Blue", "Black", "White"],
            sizes: ["S", "M", "L", "XL"],
            description: "Classic denim jacket with a vintage look. A versatile piece that pairs well with almost anything.",
            reviews: [
                Review(username: "CasualWear", userimage: "user3", rating: 5, comment: "A wardrobe staple!"),
                Review(username: "SophiaW", userimage: "user4", rating: 4, comment: "Nice jacket, but could use more stretch.")
            ],
            quantity: 15,
            rating: 4.6,
            category: "Outerwear",
            gender: "Unisex"
        ),
        Products(
            title: "Puffer Jacket",
            price: "180.00",
            image: "jacket3",
            colors: ["Black", "Gray", "Blue"],
            sizes: ["S", "M", "L", "XL"],
            description: "Warm and cozy puffer jacket with a hood. Ideal for chilly weather.",
            reviews: [
                Review(username: "WinterWarrior", userimage: "user5", rating: 5, comment: "Perfect for cold days!"),
                Review(username: "SophiaT", userimage: "user6", rating: 4, comment: "Good jacket, but could be more lightweight.")
            ],
            quantity: 18,
            rating: 4.7,
            category: "Outerwear",
            gender: "Unisex"
        ),
        Products(
            title: "Biker Jacket",
            price: "250.00",
            image: "jacket4",
            colors: ["Black", "Red", "Green"],
            sizes: ["S", "M", "L", "XL"],
            description: "Stylish biker jacket with metallic hardware and a sleek fit. Perfect for a night out.",
            reviews: [
                Review(username: "NightOut", userimage: "user7", rating: 5, comment: "Love the edgy style!"),
                Review(username: "SophiaW", userimage: "user8", rating: 4, comment: "Nice jacket, but could be a bit more comfortable.")
            ],
            quantity: 10,
            rating: 4.6,
            category: "Outerwear",
            gender: "Male"
        ),
        Products(
            title: "Trench Coat",
            price: "300.00",
            image: "jacket5",
            colors: ["Beige", "Black", "Navy"],
            sizes: ["S", "M", "L", "XL"],
            description: "Elegant trench coat with a belted waist and double-breasted design. Perfect for adding sophistication to any outfit.",
            reviews: [
                Review(username: "BusinessCasual", userimage: "user9", rating: 5, comment: "Stylish and timeless!"),
                Review(username: "SophiaA", userimage: "user10", rating: 4, comment: "Great coat, but could be a bit warmer.")
            ],
            quantity: 12,
            rating: 4.7,
            category: "Outerwear",
            gender: "Unisex"
        ),
        Products(
            title: "Denim Trucker Jacket",
            price: "130.00",
            image: "jacket6",
            colors: ["Blue", "Black", "White"],
            sizes: ["S", "M", "L"],
            description: "Casual denim trucker jacket with a relaxed fit and vintage appeal.",
            reviews: [
                Review(username: "CasualWear", userimage: "user11", rating: 5, comment: "Great for layering!"),
                Review(username: "SophiaT", userimage: "user12", rating: 4, comment: "Nice jacket, but could be a bit more structured.")
            ],
            quantity: 15,
            rating: 4.5,
            category: "Outerwear",
            gender: "Unisex"
        ),
    //Jeans
        Products(
            title: "Skinny High Waist Jeans",
            price: "110.00",
            image: "jeans1",
            colors: ["Blue", "Black", "White"],
            sizes: ["26", "28", "30", "32"],
            description: "High waist skinny jeans with a comfortable stretch. Perfect for a casual day out.",
            reviews: [
                Review(username: "CasualWear", userimage: "user1", rating: 5, comment: "Love the fit and feel!"),
                Review(username: "EmmaJ", userimage: "user2", rating: 4, comment: "Nice jeans, but could be a bit more flattering.")
            ],
            quantity: 20,
            rating: 4.8,
            category: "Clothing",
            gender: "Female"
        ),
        Products(
            title: "Bootcut Jeans",
            price: "130.00",
            image: "jeans2",
            colors: ["Blue", "Black", "Gray"],
            sizes: ["26", "28", "30", "32", "34"],
            description: "Classic bootcut jeans with a comfortable fit and timeless style.",
            reviews: [
                Review(username: "StreetStyle", userimage: "user3", rating: 5, comment: "Great jeans for any season!"),
                Review(username: "SophiaW", userimage: "user4", rating: 4, comment: "Nice jeans, but could be a bit tighter.")
            ],
            quantity: 15,
            rating: 4.7,
            category: "Clothing",
            gender: "Female"
        ),
        Products(
            title: "Straight Leg Jeans",
            price: "120.00",
            image: "jeans3",
            colors: ["Blue", "Black", "White"],
            sizes: ["26", "28", "30", "32"],
            description: "Versatile straight leg jeans with a relaxed fit. Suitable for both casual and business looks.",
            reviews: [
                Review(username: "BusinessCasual", userimage: "user5", rating: 5, comment: "Great jeans for work!"),
                Review(username: "SophiaT", userimage: "user6", rating: 4, comment: "Nice jeans, but could be a bit longer.")
            ],
            quantity: 18,
            rating: 4.6,
            category: "Clothing",
            gender: "Male"
        ),
        Products(
            title: "Mom Jeans",
            price: "140.00",
            image: "jeans4",
            colors: ["Blue", "Black", "Gray"],
            sizes: ["26", "28", "30", "32"],
            description: "Comfortable mom jeans with a high waist and relaxed fit. Perfect for a laid-back look.",
            reviews: [
                Review(username: "TrendyGal", userimage: "user7", rating: 5, comment: "Love the retro style!"),
                Review(username: "SophiaW", userimage: "user8", rating: 4, comment: "Nice jeans, but could be a bit looser.")
            ],
            quantity: 10,
            rating: 4.5,
            category: "Clothing",
            gender: "Female"
        ),
        Products(
            title: "Wide Leg Jeans",
            price: "150.00",
            image: "jeans5",
            colors: ["Blue", "Black", "White"],
            sizes: ["26", "28", "30", "32", "34"],
            description: "Trendy wide leg jeans with a flattering fit and comfortable stretch. Ideal for casual outings.",
            reviews: [
                Review(username: "StreetStyle", userimage: "user9", rating: 5, comment: "Great for casual wear!"),
                Review(username: "SophiaA", userimage: "user10", rating: 4, comment: "Nice jeans, but could be a bit tighter.")
            ],
            quantity: 12,
            rating: 4.6,
            category: "Clothing",
            gender: "Female"
        ),
        Products(
            title: "Distressed Skinny Jeans",
            price: "120.00",
            image: "jeans6",
            colors: ["Blue", "Black", "Gray"],
            sizes: ["26", "28", "30"],
            description: "Stylish distressed skinny jeans with a flattering high waist. Perfect for a trendy look.",
            reviews: [
                Review(username: "TrendyGal", userimage: "user11", rating: 5, comment: "Love the style and fit!"),
                Review(username: "SophiaT", userimage: "user12", rating: 4, comment: "Nice jeans, but could be a bit more comfortable.")
            ],
            quantity: 15,
            rating: 4.7,
            category: "Clothing",
            gender: "Female"
        ),
    //Hoodies
        Products(
            title: "Classic Hoodie",
            price: "60.00",
            image: "hoodie1",
            colors: ["Black", "Gray", "Navy"],
            sizes: ["S", "M", "L", "XL"],
            description: "Comfortable classic hoodie with a drawstring hood and a relaxed fit. Perfect for casual wear.",
            reviews: [
                Review(username: "EverydayFashion", userimage: "user1", rating: 5, comment: "Super comfy and warm!"),
                Review(username: "EmmaJ", userimage: "user2", rating: 4, comment: "Nice hoodie, but could be a bit thicker.")
            ],
            quantity: 20,
            rating: 4.8,
            category: "Clothing",
            gender: "Unisex"
        ),
        Products(
            title: "Zip-Up Hoodie",
            price: "70.00",
            image: "hoodie2",
            colors: ["Black", "Gray", "Red"],
            sizes: ["S", "M", "L", "XL"],
            description: "Versatile zip-up hoodie with a comfortable fit. Perfect for layering.",
            reviews: [
                Review(username: "StreetStyle", userimage: "user3", rating: 5, comment: "Great for layering!"),
                Review(username: "SophiaW", userimage: "user4", rating: 4, comment: "Nice hoodie, but could be more breathable.")
            ],
            quantity: 18,
            rating: 4.6,
            category: "Clothing",
            gender: "Unisex"
        ),
        Products(
            title: "Oversized Hoodie",
            price: "80.00",
            image: "hoodie3",
            colors: ["Black", "Gray", "White"],
            sizes: ["S", "M", "L", "XL"],
            description: "Trendy oversized hoodie with a relaxed fit. Perfect for lounging.",
            reviews: [
                Review(username: "CasualWear", userimage: "user5", rating: 5, comment: "Love the cozy fit!"),
                Review(username: "SophiaT", userimage: "user6", rating: 4, comment: "Nice hoodie, but could be a bit longer.")
            ],
            quantity: 15,
            rating: 4.7,
            category: "Clothing",
            gender: "Unisex"
        ),
        Products(
            title: "Graphic Hoodie",
            price: "90.00",
            image: "hoodie4",
            colors: ["Black", "Gray", "White"],
            sizes: ["S", "M", "L"],
            description: "Trendy graphic hoodie with a bold design. Perfect for expressing style.",
            reviews: [
                Review(username: "TrendyGal", userimage: "user7", rating: 5, comment: "Love the design and fit!"),
                Review(username: "SophiaW", userimage: "user8", rating: 4, comment: "Nice hoodie, but could be a bit more subtle.")
            ],
            quantity: 12,
            rating: 4.6,
            category: "Clothing",
            gender: "Unisex"
        ),
        Products(
            title: "Pullover Hoodie",
            price: "75.00",
            image: "hoodie5",
            colors: ["Black", "Gray", "Blue"],
            sizes: ["S", "M", "L", "XL"],
            description: "Classic pullover hoodie with a kangaroo pocket and soft interior lining.",
            reviews: [
                Review(username: "EverydayFashion", userimage: "user9", rating: 5, comment: "Super comfy and warm!"),
                Review(username: "SophiaA", userimage: "user10", rating: 4, comment: "Nice hoodie, but could be a bit thicker.")
            ],
            quantity: 15,
            rating: 4.7,
            category: "Clothing",
            gender: "Unisex"
        ),
        Products(
            title: "Hoodie Dress",
            price: "120.00",
            image: "hoodie6",
            colors: ["Black", "Gray", "White"],
            sizes: ["S", "M", "L", "XL"],
            description: "Trendy hoodie dress with a relaxed fit and adjustable drawstring waist. Perfect for a casual day out.",
            reviews: [
                Review(username: "CasualWear", userimage: "user11", rating: 5, comment: "Great for a comfortable look!"),
                Review(username: "SophiaT", userimage: "user12", rating: 4, comment: "Nice hoodie, but could be a bit longer.")
            ],
            quantity: 12,
            rating: 4.6,
            category: "Clothing",
            gender: "Female"
        ),
//Hoodies
    Products(
        title: "Oversized Hoodie",
        price: "60.00",
        image: "hoodie1",
        colors: ["Black", "Gray", "Navy"],
        sizes: ["S", "M", "L", "XL"],
        description: "A cozy oversized hoodie perfect for a relaxed look. Ideal for chilly days and lounging.",
        reviews: [
            Review(username: "CoolDude", userimage: "user3", rating: 5, comment: "Super comfortable and stylish!"),
            Review(username: "JessieL", userimage: "user4", rating: 4, comment: "Nice fit, good for layering.")
        ],
        quantity: 15,
        rating: 4.7,
        category: "Hoodies",
        gender: "Unisex"
    ),
    Products(
        title: "Graphic Hoodie",
        price: "70.00",
        image: "hoodie2",
        colors: ["Black", "White", "Red"],
        sizes: ["S", "M", "L", "XL"],
        description: "A bold graphic hoodie to make a statement. Perfect for streetwear enthusiasts.",
        reviews: [
            Review(username: "StreetStyle", userimage: "user5", rating: 5, comment: "Love the graphics, great quality!"),
            Review(username: "AlexM", userimage: "user6", rating: 4, comment: "Cool design, but runs a bit small.")
        ],
        quantity: 12,
        rating: 4.6,
        category: "Hoodies",
        gender: "Unisex"
    ),
    Products(
        title: "Zip-Up Hoodie",
        price: "65.00",
        image: "hoodie3",
        colors: ["Black", "Gray", "Blue"],
        sizes: ["S", "M", "L", "XL"],
        description: "A versatile zip-up hoodie for easy layering and comfort.",
        reviews: [
            Review(username: "LayerUp", userimage: "user7", rating: 5, comment: "Perfect fit and so practical!"),
            Review(username: "SamR", userimage: "user8", rating: 4, comment: "Good quality, but wish it had a pocket.")
        ],
        quantity: 20,
        rating: 4.5,
        category: "Hoodies",
        gender: "Unisex"
    ),
//    Accessories
    Products(
        title: "Classic Sunglasses",
        price: "80.00",
        image: "sunglasses1",
        colors: ["Black", "Brown", "Gray"],
        sizes: ["One Size"],
        description: "A timeless pair of sunglasses that combines style and UV protection. Perfect for any sunny day.",
        reviews: [
            Review(username: "SunnyDays", userimage: "user9", rating: 5, comment: "Love these shades! Great quality."),
            Review(username: "LuxeFashion", userimage: "user10", rating: 4, comment: "Nice but a bit too large for my face.")
        ],
        quantity: 25,
        rating: 4.6,
        category: "Accessories",
        gender: "Unisex"
    ),
    Products(
        title: "Leather Belt",
        price: "45.00",
        image: "belt1",
        colors: ["Black", "Brown"],
        sizes: ["S", "M", "L"],
        description: "A classic leather belt that adds a touch of sophistication to any outfit.",
        reviews: [
            Review(username: "StyleAddict", userimage: "user11", rating: 5, comment: "Excellent quality and fit!"),
            Review(username: "Timeless", userimage: "user12", rating: 4, comment: "Good, but could be a bit wider.")
        ],
        quantity: 30,
        rating: 4.7,
        category: "Accessories",
        gender: "Unisex"
    ),
    Products(
        title: "Wrist Watch",
        price: "120.00",
        image: "watch1",
        colors: ["Black", "Silver", "Gold"],
        sizes: ["One Size"],
        description: "A sleek wristwatch that complements any style. Perfect for both formal and casual occasions.",
        reviews: [
            Review(username: "TimeKeeper", userimage: "user13", rating: 5, comment: "Beautiful watch, great design!"),
            Review(username: "ElegantMan", userimage: "user14", rating: 4, comment: "Good watch, but a bit bulky for my taste.")
        ],
        quantity: 18,
        rating: 4.8,
        category: "Accessories",
        gender: "Unisex"
    ),
    //Sneakers
    Products(
        title: "Running Sneakers",
        price: "100.00",
        image: "sneaker1",
        colors: ["White", "Black", "Blue"],
        sizes: ["7", "8", "9", "10", "11"],
        description: "High-performance sneakers designed for comfort and speed during running.",
        reviews: [
            Review(username: "RunFast", userimage: "user15", rating: 5, comment: "Perfect for running, very comfortable!"),
            Review(username: "Athleisure", userimage: "user16", rating: 4, comment: "Good, but could use more cushioning.")
        ],
        quantity: 20,
        rating: 4.6,
        category: "Sneakers",
        gender: "Unisex"
    ),
    Products(
        title: "Slip-On Sneakers",
        price: "75.00",
        image: "sneaker2",
        colors: ["Black", "Gray", "Red"],
        sizes: ["S", "M", "L", "XL"],
        description: "A versatile slip-on sneaker for easy wear and comfort throughout the day.",
        reviews: [
            Review(username: "EasyWear", userimage: "user17", rating: 5, comment: "Super easy to put on and comfortable!"),
            Review(username: "QuickStep", userimage: "user18", rating: 4, comment: "Good, but a bit loose for narrow feet.")
        ],
        quantity: 18,
        rating: 4.5,
        category: "Sneakers",
        gender: "Unisex"
    ),
    Products(
        title: "High-Top Sneakers",
        price: "90.00",
        image: "sneaker3",
        colors: ["Black", "White", "Red"],
        sizes: ["8", "9", "10", "11", "12"],
        description: "Stylish high-top sneakers with a modern twist. Perfect for both casual and streetwear looks.",
        reviews: [
            Review(username: "StreetKing", userimage: "user19", rating: 5, comment: "Love the style and fit!"),
            Review(username: "UrbanChic", userimage: "user20", rating: 4, comment: "Great look, but need more arch support.")
        ],
        quantity: 22,
        rating: 4.7,
        category: "Sneakers",
        gender: "Unisex"
    ),
    Products(
        title: "Graphic T-Shirt",
        price: "30.00",
        image: "tshirt1",
        colors: ["White", "Black", "Red"],
        sizes: ["S", "M", "L", "XL"],
        description: "A bold graphic t-shirt that makes a statement. Perfect for casual wear.",
        reviews: [
            Review(username: "ArtLover", userimage: "user21", rating: 5, comment: "Great design, love it!"),
            Review(username: "StyleSeek", userimage: "user22", rating: 4, comment: "Good quality, but a bit tight.")
        ],
        quantity: 25,
        rating: 4.6,
        category: "T-Shirts",
        gender: "Unisex"
    ),
    Products(
        title: "Plain Crew Neck T-Shirt",
        price: "25.00",
        image: "tshirt2",
        colors: ["White", "Black", "Gray"],
        sizes: ["S", "M", "L", "XL"],
        description: "A classic crew neck t-shirt for everyday wear. Comfortable and versatile.",
        reviews: [
            Review(username: "CasualGuy", userimage: "user23", rating: 5, comment: "Perfect fit and feel."),
            Review(username: "Minimalist", userimage: "user24", rating: 4, comment: "Good basic tee, but could be a bit softer.")
        ],
        quantity: 30,
        rating: 4.7,
        category: "T-Shirts",
        gender: "Unisex"
    ),
    Products(
        title: "Striped T-Shirt",
        price: "35.00",
        image: "tshirt3",
        colors: ["Blue/White", "Black/Gray", "Red/White"],
        sizes: ["S", "M", "L", "XL"],
        description: "A stylish striped t-shirt for a classic yet contemporary look.",
        reviews: [
            Review(username: "PreppyStyle", userimage: "user25", rating: 5, comment: "Love the stripes, great casual look!"),
            Review(username: "FashionFan", userimage: "user26", rating: 4, comment: "Good quality, but could have a bit more stretch.")
        ],
        quantity: 20,
        rating: 4.6,
        category: "T-Shirts",
        gender: "Unisex"
    ),
    Products(
        title: "Henley T-Shirt",
        price: "40.00",
        image: "tshirt4",
        colors: ["Navy", "Black", "Gray"],
        sizes: ["S", "M", "L", "XL"],
        description: "A modern henley t-shirt with a button-up collar, perfect for a casual-chic look.",
        reviews: [
            Review(username: "ChicMan", userimage: "user27", rating: 5, comment: "Great style, very comfortable!"),
            Review(username: "FashionAdept", userimage: "user28", rating: 4, comment: "Good quality, but a bit snug around the chest.")
        ],
        quantity: 18,
        rating: 4.7,
        category: "T-Shirts",
        gender: "Unisex"
    ),
    Products(
        title: "V-Neck T-Shirt",
        price: "32.00",
        image: "tshirt5",
        colors: ["Black", "White", "Gray"],
        sizes: ["S", "M", "L", "XL"],
        description: "A classic v-neck t-shirt that offers a flattering fit and casual elegance.",
        reviews: [
            Review(username: "V-NeckLover", userimage: "user29", rating: 5, comment: "Flattering and comfortable!"),
            Review(username: "StyleCritic", userimage: "user30", rating: 4, comment: "Good, but wish it was a bit longer.")
        ],
        quantity: 22,
        rating: 4.6,
        category: "T-Shirts",
        gender: "Unisex"
    ),
    Products(
        title: "Polo T-Shirt",
        price: "45.00",
        image: "tshirt6",
        colors: ["White", "Black", "Green"],
        sizes: ["S", "M", "L", "XL"],
        description: "A classic polo t-shirt that blends casual and smart for versatile styling.",
        reviews: [
            Review(username: "CasualChic", userimage: "user31", rating: 5, comment: "Perfect for both casual and semi-formal occasions."),
            Review(username: "PoloFan", userimage: "user32", rating: 4, comment: "Good quality, but could use more structure.")
        ],
        quantity: 15,
        rating: 4.7,
        category: "T-Shirts",
        gender: "Unisex"
    ),



    ]





