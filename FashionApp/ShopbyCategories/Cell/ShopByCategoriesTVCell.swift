//
//  ShopByCategoriesTVCell.swift
//  FashionApp
//
//  Created by Engy on 11/16/24.
//

import UIKit

class ShopByCategoriesTVCell: UITableViewCell {
    @IBOutlet var itemTitle: UILabel!
    @IBOutlet var itemImg: UIImageView!
    @IBOutlet var backView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    private func setupUI() {
        backView.layer.cornerRadius = 12
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: false)
    }

    func config(_ item: CategoryModel) {
        itemTitle.text = item.title
        itemImg.image = UIImage(named: item.image)
    }
}
