
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
        titleLBL.setCustomFont(font: .GabaritoBold, size: 32)
        subTitleLbl.setCustomFont(font: .CircularStdBook, size: 16)
        orderDetails.setCustomFont(font: .CircularStdBook, size: 16)
    }
    
    @IBAction func orderDetailsCliked(_ sender: Any) {

    }
    
}
