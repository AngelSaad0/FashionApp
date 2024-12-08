//
//  LocalizedLabels.swift
//  SukkarApp
//
//  Created by Engy on 1/13/2567 BE.
//

import Foundation
enum LocalizedLabels: String {
    case none
    case welcome
    case continueAs
    case agreeFor
    case editProfileLbl
    case signinlabel
    case createAccountLabel
    case forgotPasswordLabel
    case tellUsAboutYourself
    case whoDoYouShopFor
    case howOldAreYou
    case ageRange
    case dontHaveAnAccount
    case continueWithApple
    case continueWithGoogle
    case continueWithFacebook
    case emailResetPassword
    case firstNameEmpty
    case lastNameEmpty
    case emailEmpty
    case passwordEmpty
    case confirmPasswordEmpty
    case invalidEmail
    case passwordsDoNotMatch
    case submit
    case cancel
    case ok
    case error
    case success
    case loading


var title: String {
    return self.rawValue.localized
}
}
