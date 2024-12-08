//
//  HomeHeaderReusable.swift
//  FashionApp
//
//  Created by Engy on 11/16/24.
//

import UIKit

class HomeHeaderReusable: UICollectionReusableView {

    @IBOutlet weak var lblSectionHeader: UILabel!

    @IBOutlet var seeAllBtn: UIButton!
    var action:(()->())?
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func config(_ item: HomeHeaderModel) {
        lblSectionHeader.text = item.title.rawValue
        lblSectionHeader.setCustomFont(font: .GabaritoBold, size: .size16)
        seeAllBtn.setCustomFont(font: .GabaritoBold, size: .size16)
        action = item.action
        if item.title == .NewIn {
            lblSectionHeader.textColor = ._8_E_6_CEF
        }
    }
    @IBAction func seeBtnCliked(_ sender: UIButton) {
        action?()
    }
    
}
