//
//  ShopByCategoriesTVCell.swift
//  FashionApp
//
//  Created by Engy on 11/16/24.
//

import UIKit
import Kingfisher

class ShopByCategoriesTVCell: UITableViewCell {
    @IBOutlet var itemTitle: UILabel!
    @IBOutlet var itemImg: UIImageView!
    @IBOutlet var containerView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    private func setupUI() {
        containerView.layer.cornerRadius = 12
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: false)
    }

    func config(_ item: CategoryModel) {
        itemTitle.text = item.title
        itemImg.image = UIImage(named: item.image)
    }
    func config(_ item: Category) {
        itemTitle.text = item.details.title.rawValue
        itemImg.image = UIImage(named: item.details.icon.rawValue)
    }
    func config(_ item: SmartCollection) {
        itemTitle.text = item.title
        itemImg.kf.setImage(with: URL(string: item.image.src), placeholder: UIImage(systemName: Assets.circleDotted.rawValue))
    }
}
