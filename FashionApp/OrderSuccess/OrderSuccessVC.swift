
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
        containerView.layer.cornerRadius = 25
        subTitleLbl.setCircularFont(size: 16)
        titleLBL.setGabaritoFont(size: 32)
        orderDetails.layer.cornerRadius = 20

        orderDetails.setCircularFont(size: 16)

    }
    @IBAction func orderDetailsCliked(_ sender: Any) {

    }
    
}
