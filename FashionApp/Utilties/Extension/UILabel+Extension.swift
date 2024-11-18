//
//  LabelCircularFont.swift
//  FashionApp
//
//  Created by Engy on 11/16/24.
//

import UIKit

extension UILabel {
    func setCircularFont(size: CGFloat) {
        self.font = UIFont(name: "CircularStd-Book", size: size)
    }
    func setCircularBoldFont(size: CGFloat) {
        self.font = UIFont(name: "CircularStd-Bold", size: size)
    }


    func setGabaritoFont(size: CGFloat) {
        self.font = UIFont(name: "Gabarito-Bold", size: size)

    }
   
}
