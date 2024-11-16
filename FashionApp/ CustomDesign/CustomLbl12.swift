//
//  CustomLbl12.swift
//  FashionApp
//
//  Created by Engy on 11/15/24.
//

import UIKit

class CustomLbl12: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLabel()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLabel()
    }

    private func setupLabel() {
        self.font = UIFont(name: "CircularStd-Book", size: 12)
    }
}
