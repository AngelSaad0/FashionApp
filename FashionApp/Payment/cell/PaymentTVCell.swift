//
//  PaymentTVCell.swift
//  FashionApp
//
//  Created by Engy on 11/18/24.
//

import UIKit

class PaymentTVCell: UITableViewCell {

    @IBOutlet var itemLabel: UILabel!
    @IBOutlet var iconImageView: UIImageView!
    @IBOutlet var containerView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    func setupUI() {
        containerView.layer.cornerRadius = 8
        containerView.layer.masksToBounds = true
        itemLabel.setCustomFont(size: .size16)
    }

    func configure(item: String, iconName: String?) {
        itemLabel.text = item
        if let iconName = iconName {
            iconImageView.image = UIImage(named: iconName)
        } else {
            iconImageView.isHidden = true
        }
    }
}
