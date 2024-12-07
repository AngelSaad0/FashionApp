//
//  ProductReviewCell.swift
//  FashionApp
//
//  Created by Engy on 11/19/24.
//

import UIKit

class ProductReviewCell: UITableViewCell {

    @IBOutlet var userImg: UIImageView!
    @IBOutlet var ratingLbl: UILabel!
    @IBOutlet var descriptionLbl: UILabel!
    @IBOutlet var userName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        userImg.layer.cornerRadius = userImg.frame.height/2
        userName.setCustomFont(font: .GabaritoBold, size: .extraSmall)
        ratingLbl.setCustomFont(size: .extraSmall)
        descriptionLbl.setCustomFont(size: .extraSmall)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func config(_ item:Review) {
        userImg.image = UIImage(named:item.userimage)
        userName.text = item.username
        let ratingArray = Array(repeating: "⭐", count: item.rating).joined()
        ratingLbl.text = ratingArray
        descriptionLbl.text = item.comment
    }
}
