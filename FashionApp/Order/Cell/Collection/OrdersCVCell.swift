//
//  OrdersCVCell.swift
//  FashionApp
//
//  Created by Engy on 11/16/24.
//

import UIKit

class OrdersCVCell: UICollectionViewCell {
    @IBOutlet var titleLbl: UILabel!
    @IBOutlet var containerView: UIView!
    var buttonTapHandler: (() -> Void)?
    // MARK: - Initializers
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    func setupUI() {
        containerView.addCornerRadius(16)
        titleLbl.setCustomFont(size: .extraSmall)
    }

    func confige(_ item: OrdersStateModel) {
        titleLbl.text = item.stateTitle.rawValue
        containerView.backgroundColor = item.state ? ._8_E_6_CEF : .backButton
    }
}

