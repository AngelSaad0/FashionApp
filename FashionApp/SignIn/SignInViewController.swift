//
//  SignInVC.swift
//  FashionApp
//
//  Created by Engy on 11/14/24.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet var emailView: UIView!
    @IBOutlet var roundedView: [UIView]!
    @IBOutlet var titleLbl: UILabel!
    @IBOutlet var haveAccountLbl: UILabel!
    @IBOutlet var continueWithLbl: [UILabel]!
    @IBOutlet var emailTxt: UITextField!
    @IBOutlet var continueBtn: UIButton!
    @IBOutlet var createOneBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    private func updateUI() {
        titleLbl.setCustomFont(font: .CircularStdBold, size: 32)
        emailTxt.setCustomFont(font: .CircularStdBook, size: 16)
        continueBtn.setCustomFont(font: .CircularStdBook, size: 16)
        createOneBtn.setCustomFont(font: .CircularStdBold, size: 13)
        continueWithLbl.forEach{$0.setCustomFont(font: .CircularStdBold, size: 16)}
        haveAccountLbl.setCustomFont(font: .CircularStdBook,size: 12)
        emailView.addCornerRadius(8)
        roundedView.forEach{$0.addCornerRadius(20)}
    }

    @IBAction func createAccountBtnClicked(_ sender: Any) {
        presentDetail(CreateAccountVC())
    }

    @IBAction func contineBtnClicked(_ sender: Any) {
        presentDetail(LoginPasswordVC())
    }

    @IBAction func continueWithAppleBtnClicked(_ sender: Any) {
    }

    @IBAction func continueWithGoogleBtnClicked(_ sender: Any) {
    }

    @IBAction func continueWithFacebookBtnClicked(_ sender: Any) {
    }
}
