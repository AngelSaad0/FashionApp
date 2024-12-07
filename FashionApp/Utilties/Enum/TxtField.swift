//
//  TxtField.swift
//  SukkarApp
//
//  Created by Engy on 1/13/2567 BE.
//

import UIKit
//MARK: - TxtFields Enum

enum TxtField: String, CaseIterable {
    case none = ""
    case nameTF = "nameTF"
    case emailTF = "emailTF"
    case mobileTF = "mobileTF"
    case emailMobileTF = "emailMobileTF"
    case passwordTF = "passwordTF"
    case rePasswordTF = "rePasswordTF"
    case massageTF = "massageTF"
    case oldPasswordTF = "oldPasswordTF"
    case newPasswordTF = "newPasswordTF"
    case reNewPasswordTF = "reNewPasswordTF"
    var title: String {
        self.rawValue.localized
    }
    
}
