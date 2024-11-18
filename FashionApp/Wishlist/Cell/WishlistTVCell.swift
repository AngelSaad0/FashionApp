//
//  WishlistTVCell.swift
//  FashionApp
//
//  Created by Engy on 11/18/24.
//

import UIKit

class WishlistTVCell: UITableViewCell {

    @IBOutlet var backView: UIView!
    
    @IBOutlet var itemCount: UILabel!
    @IBOutlet var itemTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        updateUI()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func updateUI() {
        backView.layer.cornerRadius = 8
        itemTitle.setGabaritoFont(size: 16)
        itemCount.setCircularFont(size: 12)
    }

    func config(_ item: WishlistItem) {
        itemCount.text = "\(item.productCount) Products"
        itemTitle.text = item.title
    }

}
