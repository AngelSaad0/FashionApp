//
//  GabaritoFontLbl24.swift
//  FashionApp
//
//  Created by Engy on 11/16/24.
//

import UIKit

class GabaritoFontLbl26: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLabel()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLabel()
    }

    private func setupLabel() {
        self.font = UIFont(name: "Gabarito-Bold", size: 26)
    }
}
