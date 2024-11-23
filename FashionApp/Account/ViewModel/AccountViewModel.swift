//
//  AccountViewModel.swift
//  FashionApp
//
//  Created by Engy on 11/23/24.
//

import Foundation
class AccountViewModel {
    var onNaviagtion:(() -> ())?
    let userDefaultsManager = UserDefaultsManager.shared

    func logOut() {
        userDefaultsManager.logout()
        onNaviagtion?()
    }
}
