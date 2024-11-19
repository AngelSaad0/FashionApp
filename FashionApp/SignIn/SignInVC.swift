//
//  SignInVC.swift
//  FashionApp
//
//  Created by Engy on 11/14/24.
//

import UIKit

class SignInVC: UIViewController {
    @IBOutlet var emailView: UIView!
    @IBOutlet var roundedView: [UIView]!
    @IBOutlet var emailTxt: UITextField!
    @IBOutlet var titleLbl: UILabel!
    @IBOutlet var haveAccountLbl: UILabel!
    @IBOutlet var continueWithLbl: [UILabel]!
    @IBOutlet var continueBtn: UIButton!
    @IBOutlet var createOneBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    private func updateUI() {
        titleLbl.setCustomFont(font: .GabaritoBold, size: 32)
        emailTxt.setCustomFont(font: .CircularStdBold, size: 12)
        haveAccountLbl.setCustomFont(font: .CircularStdBook,size: 12)
        createOneBtn.setCustomFont(font: .CircularStdBold, size: 15)
        continueBtn.setCustomFont(font: .CircularStdBook, size: 16)
        continueWithLbl.forEach{$0.setCustomFont(font: .CircularStdBook, size: 16)}
        emailView.addCornerRadius(8)
        roundedView.forEach{$0.addCornerRadius(20)}
    }

    @IBAction func createAccountBtnClicked(_ sender: Any) {
        presentDetail(CreateAccountVC())
    }

    @IBAction func contineBtnClicked(_ sender: Any) {
        presentDetail(LoginPasswordVC())
    }
}
