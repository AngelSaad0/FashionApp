//
//  LoginPasswordViewModel.swift
//  FashionApp
//
//  Created by Engy on 11/23/24.
//

import Foundation
class LoginPasswordViewModel {

    var displayMessage:((ValidMessage) -> ())?
    var onNaviagtion:(() -> ())?
    let  networkManager = NetworkManager.shared
    let userDefaults = UserDefaultsManager.shared

    // MARK: - User Defaults
    func setUserDefaults() {
        userDefaults.isLogin = true
        userDefaults.storeData()
    }

    // MARK: -  fetchDataFromNetwork
    func checkPassword(password:String) {
        print(password)
        print(userDefaults.password)
        if password == userDefaults.password {
            self.setUserDefaults()
            self.onNaviagtion?()
        } else {
            self.displayMessage?(.passwordDoesNotMatch)
        }
    }
}
