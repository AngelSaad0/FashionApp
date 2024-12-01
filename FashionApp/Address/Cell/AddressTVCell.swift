//
//  AddAddressTVCell.swift
//  FashionApp
//
//  Created by Engy on 11/17/24.
//

import UIKit

class AddressTVCell: UITableViewCell {
    @IBOutlet var backImg: UIView!
    @IBOutlet var addressLbl: UILabel!
    @IBOutlet var editLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        updateUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: false)
    }

    func updateUI() {
        backImg.addCornerRadius(8)
        editLbl.setCustomFont(font: .GabaritoBold, size: 12)
        addressLbl.setCustomFont(font: .CircularStdBook, size: 16)
    }

    func config(_ item: String) {
        addressLbl.text = item
    }

}
