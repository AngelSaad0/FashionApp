//
//  NavBarTitle.swift
//  SukkarApp
//
//  Created by Engy on 2/11/2567 BE.
//

import Foundation
// nav bar title
enum VcTitle: String, CaseIterable {
    case home = "Home"
    case catagories = "Categories"
    case diabetic = "Diabetic Supplies"
    case account = "Account"
    case editProfile = "Edit Profile"
    case changePass = "Change password"
    case changePass2line = "Change \npassword"
    case orders = "Orders"
    case addresses = "Addresses"
    case favorites = "Favorites"
    case aboutUs = "About us"
    case contactUs = "Contact US"
    case none = ""
    var title: String {
         self.rawValue.localized
    }
}

