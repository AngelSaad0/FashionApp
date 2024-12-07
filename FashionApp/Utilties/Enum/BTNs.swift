//
//  BTNs.swift
//  SukkarApp
//
//  Created by Engy on 1/13/2567 BE.
//

import Foundation

// MARK: - BTNs Enum
enum BTN: String {
    
    case non = ""
    case login = "loginBtn"
    case logout = "Logout"
    case newUser = "newUserBtn"
    case save = "SaveBtn"
    case send = "SendBtn"
    case register = "RegisterBtn"
    case forgetPassword = "forgetPasswordBtn"
    case guest = "guestBtn"
    case termsCondtions = "termsCondtionsBtn"

    var title: String {
         self.rawValue.localized
    }

}
