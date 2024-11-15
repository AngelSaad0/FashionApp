//
//  haveAccountLbl.swift
//  FashionApp
//
//  Created by Engy on 11/14/24.
//

import UIKit

class haveAccountLbl: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLabel()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLabel()
    }

    private func setupLabel() {
        self.font = UIFont(name: "CircularStd-Medium", size: 11)
    }
}
