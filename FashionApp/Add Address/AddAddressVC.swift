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
        titleLbl.setCustomFont(font: .CircularStdBold, size: .extraLarge)
        saveBtn.setCustomFont(size: .medium)
        allTtx.forEach{$0.setCustomFont(size: .medium)}
        saveBtn.addCornerRadius(20)
        allCornerView.forEach{$0.addCornerRadius(8)}
    }

    @IBAction func backBtnClicked(_ sender: Any) {
        dismissDetail()
    }

    @IBAction func saveBtnClicked(_ sender: Any) {
        dismissDetail()
    }
    
}
