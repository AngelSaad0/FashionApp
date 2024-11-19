//
//  WishlistTVCell.swift
//  FashionApp
//
//  Created by Engy on 11/18/24.
//

import UIKit

class WishlistTVCell: UITableViewCell {

    @IBOutlet var containerView: UIView!
    @IBOutlet var quantityLbl: UILabel!
    @IBOutlet var titleLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        updateUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func updateUI() {
        containerView.addCornerRadius(8)
        titleLbl.setCustomFont(font: .GabaritoBold, size: 16)
        quantityLbl.setCustomFont(font: .CircularStdBook, size: 12)
    }
    
    func config(_ product: WishlistModel) {
        quantityLbl.text = "\(product.productCount) Products"
        titleLbl.text = product.title
    }

}
