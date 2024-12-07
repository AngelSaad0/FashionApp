//
//  lbls.swift
//  SukkarApp
//
//  Created by Engy on 1/13/2567 BE.
//

import Foundation
enum Lbls: String{
    case none = ""
    case welcome = "welcomeLbl"
    case continueAs = "continueAsLbl"
    case agreeFor = "agreeForLbl"
    case editProfileLbl = "editProfileLbl"

    
    var title: String {
        return self.rawValue.localized
    }
}
