//
//  OrdersTVCell.swift
//  FashionApp
//
//  Created by Engy on 11/16/24.
//

import UIKit

class OrdersTVCell: UITableViewCell {

    @IBOutlet weak var orderNumberLbl: UILabel!
    @IBOutlet weak var orderCountLbl: UILabel!
    @IBOutlet var backImage: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    func setupUI() {
        orderNumberLbl.setCircularFont(size: 16)
        orderCountLbl.setCircularFont(size: 12)
        backImage.layer.cornerRadius = 8
    }

    func config(_ item: OrdersModel) {
        orderNumberLbl.text = "Order  #\(item.id)"
        orderCountLbl.text = "\(item.orderCount) items"

    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: false)

    }


}
