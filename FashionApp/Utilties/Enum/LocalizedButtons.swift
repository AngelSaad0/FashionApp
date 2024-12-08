//
//  LocalizedButtons.swift
//  SukkarApp
//
//  Created by Engy on 1/13/2567 BE.
//


import Foundation

// MARK: - LocalizedButtons Enum
enum LocalizedButtons: String {
    case none
    case login
    case logout
    case newUser
    case save
    case send
    case register
    case forgotPassword
    case guest
    case termsAndConditions
    case submit
    case cancel
    case ok
    case continueWithApple
    case continueWithGoogle
    case continueWithFacebook
    case `continue`
    case editProfile
    case signIn
    case createAccount
    case agreeToTerms
    case welcomeMessage
    case dontHaveAccount
    case tellUsAboutYou
    case whoDoYouShopFor
    case ageRange
    case emailResetPassword
    case continueAs
    case success
    case error
    case loading
    case reset
    case finish
    case male
    case female

    var title: String {
        return self.rawValue.localized
    }
}
