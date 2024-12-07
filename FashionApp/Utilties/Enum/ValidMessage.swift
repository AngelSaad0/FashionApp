//
//  Massage.swift
//  SukkarApp
//
//  Created by Engy on 2/3/2567 BE.
//


import Foundation

public enum ValidMessage: String {
    case none = ""
    case firstNameEmpty = "firstNameEmpty"
    case lastNameEmpty = "lastNameEmpty"
    case firstNameInvalid = "firstNameInvalid"
    case lastNameInvalid = "lastNameInvalid"
    case emailEmpty = "emailEmpty"
    case emailInvalid = "emailInvalid"
    case passwordEmpty = "passwordEmpty"
    case passwordInvalid = "passwordInvalid"
    case confirmPasswordEmpty = "confirmPasswordEmpty"
    case confirmPasswordInvalid = "confirmPasswordInvalid"
    case passwordsMismatch = "passwordsMismatch"
    case mobileInvalid = "mobileInvalid"
    case mobileEmpty = "mobileEmpty"
    case termsConditionsNotAccepted = "termsConditionsNotAccepted"
    case success = "success"
    case notAvailable = "Not Available know"
    case nameEmpty = "Name is empty"
    case nameValid = "Name is not valid"
    case emailValid = "Email is not valid"
    case passwordValid = "Password is not valid"
    case reTypeEmpty = "ReType password is empty"
    case reTypeValid = "ReType password is not valid"
    case passwordRetypeEqual = "Passwords are not equal"
    case mobileValid = "Mobile is not valid"
    case addressEmpty = "Address is empty"
    case addressValid = "Address is not valid"
    case cityEmpty = "City is empty"
    case cityValid = "City is not valid"
    case countryEmpty = "Country is empty"
    case countryValid = "Country is not valid"
    case termsConditions = "agree for term and conditions"
    case successLogin = "LoggedIn Successfully"
    case successRegister = "Registered Successfully"
    case checkingEmailFail = "Error checking if email not already registered"
    case emailExist = "Entered email already exists"
    case encodingFail = "Error encoding customer info"
    case customerCreationFail = "Failed to create new customer"
    case draftsCreationFail = "Failed to create ShoppingCart or Wishlist"
    case emailDoesNotExist = "Entered email does not exist"
    case passwordDoesNotMatch = "You have entered wrong password"
    case addedToWishlist = "Item successfully added to wishlist"
    case removedFromWishlist = "Item successfully removed from wishlist"
    case addedToShoppingCart = "Item successfully added to shopping cart"
    case foundInShoppingCart = "Item found in shopping cart"
    case removedFromShoppingCart = "Item successfully removed from shopping cart"
    case ordersFetchingFailed = "Error happened while loading your orders"
    case addressesFetchingFailed = "Error happened while loading your addresses"
    case newSelectedAddressFailed = "Error happened while updating your default address"
    case defaultAddressUpdated = "Default address updated successfully"
    case newAddressAdded = "New address added successfully"
    case addressEdited = "Address has been edited successfully"
    case discountCodeEmpty = "You have not entered a discount code"
    case discountCodeFailed = "Entered discount code is not valid"
    case discountCodeApplied = "Congratulations, discount code applied"
    case placingOrderFailed = "Error happened while sending your order"
    case emptyOrderArray = "No order found"
    case exchangeRateFailed = "Failed to update currency setting"
    
    var title: String {
        self.rawValue.localized
    }
}
