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
        titleLbl.setCustomFont(font: .CircularStdBold, size: 32)
        emailTxt.setCustomFont(font: .CircularStdBook, size: 16)
        contineBtn.setCustomFont(font: .CircularStdBook, size: 16)
        emailView.addCornerRadius(8)
        contineBtn.addCornerRadius(20)
    }

    @IBAction func contineBtnclicked(_ sender: Any) {
        presentDetail(ResetPasswordVC())
    }

    @IBAction func backBtnClicked(_ sender: Any) {
        dismissDetail()
    }

}
