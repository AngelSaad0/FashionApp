//
//  TxtField.swift
//  SukkarApp
//
//  Created by Engy on 1/13/2567 BE.
//

import UIKit

// MARK: - LocalizedTextField Enum
enum LocalizedTextField: String, CaseIterable {
    case none = ""
    case name
    case firstName
    case lastName
    case email
    case mobile
    case emailOrMobile
    case password
    case retypePassword
    case message
    case oldPassword
    case newPassword
    case retypeNewPassword

    var title: String {
        self.rawValue.localized
    }
}
