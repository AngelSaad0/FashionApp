//
//  CartTVCell.swift
//  FashionApp
//
//  Created by Engy on 11/18/24.
//

import UIKit

class CartTVCell: UITableViewCell {


    @IBOutlet var itemImg: UIImageView!
    @IBOutlet var backView: UIView!
    @IBOutlet var itemName: UILabel!
    @IBOutlet var itemPrice: UILabel!
    @IBOutlet var itemSize: UILabel!
    @IBOutlet var itemColor: UILabel!
    @IBOutlet var allLblForSamllFont: [UILabel]!
    @IBOutlet var allLblForBoldFont: [UILabel]!
    @IBOutlet var itemCount: UILabel!
    @IBOutlet var btns: [UIButton]!
    @IBOutlet var plusButton: UIButton!
    @IBOutlet var minusButton: [UIButton]!


    private var item: Products?
    var onItemCountChange: ((Products, Int) -> Void)?



    private var count = 1 {
        didSet {
            itemCount.text = "\(count)"
            updatePrice()
            if let item = item {
                onItemCountChange?(item, count)
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func setupUI() {
        backView.layer.cornerRadius = 8
        allLblForSamllFont.forEach{$0.setCircularFont(size: 13)}
        allLblForBoldFont.forEach{$0.setCircularBoldFont(size: 15)}
        btns.forEach{$0.layer.cornerRadius = $0.frame.height/2}
    }

    func config(_ item: Products) {
        self.item = item
        itemImg.image = UIImage(named: item.image)
        itemName.text = item.title
        itemPrice.text = item.price
//        itemSize.text = "- \(item.sizes)"
//        itemColor.text = "- \(item.color)"
//        count = item.quantity
    }
    private func updatePrice() {
        guard let item = item else { return }
        if let basePrice = Double(item.price.replacingOccurrences(of: "$", with: "")) {
            let totalPrice = basePrice * Double(count)
            itemPrice.text = String(format: "$%.2f", totalPrice)
        }
    }

    @IBAction func plusButtonClicked(_ sender: Any) {
       
        count += 1
    }

    @IBAction func minusButtonClicked(_ sender: Any) {
        if count > 1 {
            count -= 1
        } else {
        }
    }





}
