//
//  CategoriesCVCell.swift
//  FashionApp
//
//  Created by Engy on 11/15/24.
//

import UIKit
import Kingfisher

class CategoriesCVCell: UICollectionViewCell {

    @IBOutlet var itemTitle: UILabel!
    @IBOutlet var itemImg: UIImageView!
    @IBOutlet var imageContainerView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    private func setupUI() {
        itemTitle.setCustomFont(font: .CircularStdBook, size: 12)
        DispatchQueue.main.async {
            self.imageContainerView.layer.cornerRadius = self.imageContainerView.frame.height/2
            self.imageContainerView.addBorderView(color:.containerView,width: 3)
            self.imageContainerView.clipsToBounds = true
        }
    }

    func config(_ item: CategoryModel) {
        itemTitle.text = item.image
        itemImg.image = UIImage(named: item.image)
    }
    
    func config(_ item: Category) {
        itemTitle.text = item.details.title.rawValue
        itemImg.image = UIImage(named: item.details.icon.rawValue)
    }
    func config(_ item: SmartCollection) {
        if item.title == "SUPRA" {
            imageContainerView.backgroundColor = .black
        }

        itemTitle.text = item.title
        itemImg.kf.setImage(with: URL(string: item.image.src), placeholder: UIImage(systemName: Assets.circleDotted.rawValue))
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        imageContainerView.backgroundColor = .white
        itemImg.kf.cancelDownloadTask()
        itemImg.image = nil
    }

}
