//
//  NavBarImg.swift
//  SukkarApp
//
//  Created by Engy on 2/11/2567 BE.
//
// MARK: - IMAGES Enum for navBar
import Foundation
enum NavBarImg: String, CaseIterable {
    case menu = "side_menu"
    case notification = "notification"
    case splashLogo = "small_Logo"
    case backArrow = "backArrow"
    case registerPhoto = "register_photo"
    case close = "close"
    case detailesNoimg = "detailes_noimg"
    case homeListNoimg = "home_list_noimg"
    case homeNoimg = "home_noimg"
    case filter = "filter_icon"
    case shareArrow = "share"
    var description: String {
            return self.rawValue
        }
}

