
//
//  OrderSuccessVC.swift
//  FashionApp
//
//  Created by Engy on 11/18/24.
//

import UIKit

class OrderSuccessVC: UIViewController {

    @IBOutlet var subTitleLbl: UILabel!
    @IBOutlet var containerView: UIView!
    @IBOutlet var titleLBL: UILabel!
    @IBOutlet var orderDetails: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        containerView.addCornerRadius(25)
        orderDetails.addCornerRadius(20)
        titleLBL.setCustomFont(font: .GabaritoBold, size: .size32)
        subTitleLbl.setCustomFont(size: .size16)
        orderDetails.setCustomFont(size: .size16)
    }
    
    @IBAction func orderDetailsCliked(_ sender: Any) {

    }
    
}
