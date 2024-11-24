//
//  ProductDetailsCVCell.swift
//  FashionApp
//
//  Created by Engy on 11/18/24.
//

import UIKit
import Kingfisher

class ProductDetailsCVCell: UICollectionViewCell {

    @IBOutlet var img: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    
    }


    func config(_ item:String){
        img.kf.setImage(with: URL(string: item),placeholder: UIImage(systemName: Assets.circleDotted.rawValue))
    }

}
