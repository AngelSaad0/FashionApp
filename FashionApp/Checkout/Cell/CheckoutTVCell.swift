//
//  CheckoutTVCell.swift
//  FashionApp
//
//  Created by Engy on 11/17/24.
//


import UIKit

class CheckoutTVCell: UITableViewCell {

    @IBOutlet var containerView: UIView!
    @IBOutlet var titleLbl: UILabel!
    @IBOutlet var subtitleLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        updateUI()
    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: false)
    }

    func updateUI() {
        containerView.layer.cornerRadius = 8
        titleLbl.setCustomFont(font: .CircularStdBook, size: 12)
        subtitleLbl.setCustomFont(font: .CircularStdBook, size: 16)
    }

    func configure(title: String, subtitle: String) {
                   titleLbl.text = title
                   subtitleLbl.text = subtitle
    }
}
