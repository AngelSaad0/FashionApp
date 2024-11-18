//
//  AddAddressVC.swift
//  FashionApp
//
//  Created by Engy on 11/17/24.
//

import UIKit

class AddAddressVC: UIViewController {

    @IBOutlet var titleLbl: UILabel!
    @IBOutlet var allTtx: [UITextField]!
    @IBOutlet var allCornerView: [UIView]!
    @IBOutlet var saveBtn: UIButton!
    


    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        titleLbl.setCircularBoldFont(size: 24)
        saveBtn.setCircularFont(size: 16)
        saveBtn.layer.cornerRadius = 20
        allTtx.forEach{$0.setCircularFont(size: 16)}
        allCornerView.forEach{$0.layer.cornerRadius = 8}

    }


    @IBAction func backBtnClicked(_ sender: Any) {
        dismissDetail()
    }

    @IBAction func saveBtnClicked(_ sender: Any) {
        dismissDetail()
    }
    
}
