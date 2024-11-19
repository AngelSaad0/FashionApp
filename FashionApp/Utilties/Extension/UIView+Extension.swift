//
//  UIView+Extension.swift
//  FashionApp
//
//  Created by Engy on 11/18/24.
//

import UIKit
extension UIView {
    func addCornerRadius(_ radius: CGFloat, corners: UIRectCorner) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        self.layer.mask = maskLayer
    }

    func addCornerRadius(_ radius: CGFloat) {
        self.layer.cornerRadius = radius
    }

}

