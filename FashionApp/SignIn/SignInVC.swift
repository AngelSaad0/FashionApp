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

    @IBOutlet var titleLbl: UILabel!
    @IBOutlet var emailTxt: UITextField!
    @IBOutlet var continueBtn: UIButton!
    @IBOutlet var createOneBtn: UIButton!
    @IBOutlet var haveAccountLbl: UILabel!

    @IBOutlet var continueWithLbl: [UILabel]!


    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()

    }

    private func updateUI() {
        emailView.layer.cornerRadius = 8
        emailTxt.setCircularFont(size: 12)
        continueBtn.layer.cornerRadius = 20
        roundedView.forEach{$0.layer.cornerRadius = 20}
        titleLbl.setCircularBoldFont(size: 32)
        continueWithLbl.forEach{$0.setCircularFont(size: 16)}
        haveAccountLbl.setCircularFont(size: 12)
        createOneBtn.setCircularBoldFont(size: 15)
        continueBtn.setCircularFont(size: 16)

    }

    @IBAction func createAccountBtnClicked(_ sender: Any) {
        presentDetail(CreateAccountVC())
    }

    @IBAction func contineBtnClicked(_ sender: Any) {
        presentDetail(LoginPasswordVC())

    }
    


   
}
