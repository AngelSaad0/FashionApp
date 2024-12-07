//
//  AccountTVCell.swift
//  FashionApp
//
//  Created by Engy on 11/17/24.
//

import UIKit

class AccountTVCell: UITableViewCell {

    @IBOutlet var titleLbl: UILabel!
    @IBOutlet var backView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    func setupUI() {
        backView.layer.cornerRadius = 8
        titleLbl.setCustomFont(size: .medium)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func config(_ item: String) {
        titleLbl.text = item
    }
}
