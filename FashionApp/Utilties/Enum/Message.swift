//
//  Message.swift
//  FashionApp
//
//  Created by Engy on 11/16/24.
//

enum Message {
    case notification
    case order
    case search
    case sentEmail
    case emptyCart

    var details: (title: String, icon: String) {
        switch self {
        case .notification:
            return ("No Notification yet", "bell")
        case .order:
            return ("No Orders yet", "check-out")
        case .search:
            return ("Sorry, we couldn't find any matching result for your Search.", "search")
        case .sentEmail:
            return ("We Sent you an Email to reset your password.", "sentEmail")
        case .emptyCart:
            return ("Your Cart is Empty","parcel")
        }
    }
    var actionTitle: String {
        switch self {
        case .sentEmail:
            return "Return to Login"

        default:
            return "Explore Categories"
        }

    }
}




