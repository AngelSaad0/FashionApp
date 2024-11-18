//
//  OrderDetailsTVCell.swift
//  FashionApp
//
//  Created by Engy on 11/17/24.
//

import UIKit

class OrderDetailsTVCell: UITableViewCell {

    @IBOutlet var stateLbl: UILabel!
    @IBOutlet var img: UIImageView!
    @IBOutlet var dateLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    func setupUI() {
        stateLbl.setCircularFont(size: 16)
        stateLbl.setCircularFont(size: 12)
        img.image = UIImage(named: Images.none.rawValue)
    }
    func comfig(_ item: OrdersModel,statue: Status) {
        stateLbl.text = statue.rawValue
        dateLbl.text = item.orderDate
        if statue.timeline <= item.status.timeline {
            img.image = UIImage(named: Images.check.rawValue)
        } else {
            img.image = UIImage(named: Images.uncheck.rawValue)

        }

}


override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
}

}

