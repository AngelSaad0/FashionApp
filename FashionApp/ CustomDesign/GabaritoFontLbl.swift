//
//  GabaritoFontLbl.swift
//  FashionApp
//
//  Created by Engy on 11/15/24.
//

import UIKit

class GabaritoFontLbl: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLabel()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLabel()
    }

    private func setupLabel() {
        self.font = UIFont(name: "Gabarito-Bold", size: 12)
    }
}
