//
//  TopSellingCVCell.swift
//  FashionApp
//
//  Created by Engy on 11/15/24.
//

import UIKit

class TopSellingCVCell: UICollectionViewCell {

    @IBOutlet var itemTitle: UILabel!
    @IBOutlet var itemImg: UIImageView!
    @IBOutlet var itemPrice: UILabel!
    @IBOutlet var backView: UIView!

    var isClickedBtn = false

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    private func setupUI() {
        itemTitle.setCircularFont(size: 16)
        itemPrice.setGabaritoFont(size: 16)
        contentView.backgroundColor = UIColor(named: "#f6f6f6")
        contentView.layer.cornerRadius = 16
        contentView.clipsToBounds = true

    }

    @IBAction func favoriteBtnClicked(_ sender: UIButton) {

        isClickedBtn.toggle()
        let imagName = isClickedBtn ? "heart.fill": "heart"
        sender.setImage(UIImage(systemName: imagName), for: .normal)
    }
    
    func config(_ item: Products) {

        itemTitle.text = item.title
        itemPrice.text = item.price
        itemImg.image = UIImage(named: item.image)
    }

}
