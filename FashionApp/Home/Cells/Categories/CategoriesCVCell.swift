//
//  CategoriesCVCell.swift
//  FashionApp
//
//  Created by Engy on 11/15/24.
//

import UIKit

class CategoriesCVCell: UICollectionViewCell {

    @IBOutlet var itemTitle: UILabel!
    @IBOutlet var itemImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    private func setupUI() {
        itemTitle.setCustomFont(font: .CircularStdBook, size: 12)
        DispatchQueue.main.async {
            self.itemImg.layer.cornerRadius = self.itemImg.frame.height/2
        }
    }

    func config(_ item: CategoryModel) {
        itemTitle.text = item.image
        itemImg.image = UIImage(named: item.image)
    }

}
