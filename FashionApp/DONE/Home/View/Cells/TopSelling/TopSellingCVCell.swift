//
//  TopSellingCVCell.swift
//  FashionApp
//
//  Created by Engy on 11/15/24.
//

import UIKit
import Kingfisher

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
        itemTitle.setCustomFont(font: .CircularStdBook, size: 16)
        itemPrice.setCustomFont(font: .GabaritoBold, size: 16)
        contentView.backgroundColor = UIColor(named: "#f6f6f6")
        contentView.addCornerRadius(16)
        contentView.clipsToBounds = true
    }

    @IBAction func favoriteBtnClicked(_ sender: UIButton) {
        isClickedBtn.toggle()
        let imagName = isClickedBtn ? "heart.fill": "heart"
        sender.setImage(UIImage(systemName: imagName), for: .normal)
    }
    
    func config(_ item: Product) {
        itemTitle.text = item.title.split(separator: "|").dropFirst().first?.trimmingCharacters(in: .whitespaces)
        itemPrice.text = "\(item.variants.first?.price ?? "0") $"
        itemImg.kf.setImage(with: URL(string: item.image.src),placeholder: UIImage(systemName: Assets.circleDotted.rawValue))
    }

}
