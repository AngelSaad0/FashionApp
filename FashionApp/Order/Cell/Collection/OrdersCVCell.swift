//
//  OrdersCVCell.swift
//  FashionApp
//
//  Created by Engy on 11/16/24.
//

import UIKit

class OrdersCVCell: UICollectionViewCell {

    @IBOutlet var titleLbl: UILabel!
    @IBOutlet var backView: UIView!

    var buttonTapHandler: (() -> Void)?

    // MARK: - Initializers
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }


    func setupUI() {
        backView.layer.cornerRadius = 16
        titleLbl.setCircularFont(size: 12)
    }

   

    func confige(_ item: OrdersStateModel) {

        titleLbl.text = item.stateTitle.rawValue
        backView.backgroundColor = item.state ? ._8_E_6_CEF : .backButton
    }


}

