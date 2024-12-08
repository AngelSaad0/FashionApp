//
//  ProductDropDownTVCell.swift
//  FashionApp
//
//  Created by Engy on 11/19/24.
//

import UIKit

class ProductDropDownTVCell: UITableViewCell {

    @IBOutlet var containerView: UIView!
    @IBOutlet var titleLbl: UILabel!
    @IBOutlet var checkImg: UIImageView!
    @IBOutlet var colorView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    func setupUI() {
        colorView.isHidden = true
        checkImg.isHidden = true
        colorView.layer.borderColor =  UIColor.white.cgColor
        colorView.layer.cornerRadius = colorView.frame.height/2
        containerView.layer.cornerRadius = 20
        titleLbl.setCustomFont(size: .size16)
    }

    func configCellForSize(_ item: String) {
        titleLbl.text = item
    }

    func configCellForColor(_ item: String) {
        titleLbl.text = item
        colorView.isHidden = false
        colorView.backgroundColor = UIColor(named: item)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        chechIsSelected(statue: selected)
    }



    func chechIsSelected(statue: Bool) {
        checkImg.isHidden = !statue 
        containerView.backgroundColor = statue ? ._8_E_6_CEF :.backButton
        colorView.layer.borderWidth = statue ? 2:0
    }


}
