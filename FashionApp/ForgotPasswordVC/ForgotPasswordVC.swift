//
//  ForgotPasswordVC.swift
//  FashionApp
//
//  Created by Engy on 11/14/24.
//

import UIKit

class ForgotPasswordVC: UIViewController {

    @IBOutlet var emailTxt: UITextField!
    @IBOutlet var emailView: UIView!
    @IBOutlet var titleLbl: UILabel!
    @IBOutlet var contineBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()

    }

    private func setupUI() {
        emailTxt.setCircularFont(size: 16)
        titleLbl.setCircularBoldFont(size: 32)
        contineBtn.setCircularFont(size: 16)

        emailView.layer.cornerRadius = 8
        contineBtn.layer.cornerRadius = 20

    }

    @IBAction func contineBtnclicked(_ sender: Any) {
        presentDetail(ResetPasswordVC())
    }

    @IBAction func backBtnClicked(_ sender: Any) {
        dismissDetail()
    }
    
}
