//
//  SecondBtn.swift
//  FashionApp
//
//  Created by Engy on 11/14/24.
//

import UIKit

class SecondBtn: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupButton()
    }

    private func setupButton() {
        self.titleLabel?.font = UIFont(name: "CircularStd-Bold", size: 13)
    }
}
