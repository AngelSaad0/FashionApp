
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
        titleLBL.setCustomFont(font: .GabaritoBold, size: .extraExtraLarge)
        subTitleLbl.setCustomFont(size: .medium)
        orderDetails.setCustomFont(size: .medium)
    }
    
    @IBAction func orderDetailsCliked(_ sender: Any) {

    }
    
}
