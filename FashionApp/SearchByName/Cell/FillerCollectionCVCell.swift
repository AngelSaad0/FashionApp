//
//  FillerCollectionCVCell.swift
//  FashionApp
//
//  Created by Engy on 11/20/24.
//

import UIKit

class FillerCollectionCVCell: UICollectionViewCell {

    @IBOutlet var iconView: UIImageView!
    
    @IBOutlet var titleLbl: UILabel!
    @IBOutlet var subTitleLbl: UILabel!
    @IBOutlet var containerView: UIView!
    var buttonAction:(()->())?


    override func awakeFromNib() {
        super.awakeFromNib()
        titleLbl.setCustomFont(font: .CircularStdBook, size: 12)
        subTitleLbl.setCustomFont(font: .CircularStdBook, size: 12)
        DispatchQueue.main.async {
            self.containerView.layer.cornerRadius = self.containerView.frame.height/2
        }
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLbl.text = nil
        subTitleLbl.text = nil
    }

    func config(_ option: FilterOption) {
        if option.title.first?.isNumber ?? false {
            subTitleLbl.text = option.title
        } else {
            titleLbl.text = option.title
        }
        iconView.image = UIImage(named: option.icon.rawValue)
    }
}

