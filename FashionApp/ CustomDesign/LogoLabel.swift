//
//  LogoLabel.swift
//  FashionApp
//
//  Created by Engy on 11/14/24.
//

import UIKit

class LogoLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLabel()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLabel()
    }

    private func setupLabel() {
        self.font = UIFont(name: "CircularStd-Bold",size: 32)
    }
}
