//
//  ContinueBtn.swift
//  FashionApp
//
//  Created by Engy on 11/14/24.
//

import UIKit

class ContinueBtn: UIButton {

    // Custom initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupButton()
    }

    private func setupButton() {
        self.titleLabel?.font = UIFont(name: "CircularStd-Book", size: 16)
        self.layer.cornerRadius = 24
    }
}
