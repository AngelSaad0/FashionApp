//
//  Massage.swift
//  SukkarApp
//
//  Created by Engy on 2/3/2567 BE.
//

import Foundation
public enum ValidMsg: String {
   case none = ""
   case nameEmpty = "nameEmpty"
   case nameVaild =  "nameVaild"
   case emailEmpty = "emailEmpty"
   case emailValid = "emailValid"
   case passwordEmpty = "passwordEmpty"
   case passwordVaild =  "passwordVaild"
   case reTypeEmpty = "reTypeEmpty"
   case reTypeVaild = "reTypeVaild"
   case passwordRetypeEqual = "passwordRetypeEqual"
   case mobileVaild = "mobileVaild"
   case mobileEmpty = "mobileEmpty"
   case termsConditions = "termsConditions"
   case succeses = "Succeses"
    var title: String {
         self.rawValue.localized
    }

}
