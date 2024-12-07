//
//  AlertTxt.swift
//  SukkarApp
//
//  Created by Engy on 1/28/2567 BE.
//

import Foundation
enum AlertTit: String {
    case NewAddress = "newAddress"
    
    var title: String {
         self.rawValue.localized
    }
}
