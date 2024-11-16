//
//  HomeHeaderReusable.swift
//  FashionApp
//
//  Created by Engy on 11/16/24.
//

import UIKit

class HomeHeaderReusable: UICollectionReusableView {

    @IBOutlet weak var lblSectionHeader: UILabel!

    var action:(()->())?

    override func awakeFromNib() {
        super.awakeFromNib()

    }

    func config(_ item: HomeHeaderModel) {
        lblSectionHeader.text = item.title
        action = item.action
    }

    @IBAction func seeBtnCliked(_ sender: UIButton) {
        action?()
    }
    
}
