//
//  UIButton+Extension.swift
//  FashionApp
//
//  Created by Engy on 11/16/24.
//

import UIKit
extension UIButton {
    func setCircularFont(size: CGFloat) {
        self.titleLabel?.font = UIFont(name: "CircularStd-Book", size: size)
    }
    func setCircularBoldFont(size: CGFloat) {
        self.titleLabel?.font  = UIFont(name: "CircularStd-Bold", size: size)
    }
    func setGabaritoFont(size: CGFloat) {
        self.titleLabel?.font = UIFont(name: "Gabarito-Bold", size: size)
    }
    
}