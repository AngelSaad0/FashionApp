//
//  LoginPasswordVC.swift
//  FashionApp
//
//  Created by Engy on 11/14/24.
//

import UIKit

class LoginPasswordVC: UIViewController {
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet var forgetTxt: UITextField!
    @IBOutlet var forgetLbl: UILabel!
    @IBOutlet var titleLbl: UILabel!
    @IBOutlet var continueBtn: UIButton!
    @IBOutlet var resetBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    private func updateUI() {
        passwordView.addCornerRadius(8)
        titleLbl.setCustomFont(font: .CircularStdBold, size: 32)
        continueBtn.setCustomFont(font: .CircularStdBook, size: 16)
        resetBtn.setCustomFont(font: .CircularStdBold, size: 15)
        forgetLbl.setCustomFont(font: .CircularStdBook, size: 12)
        forgetTxt.setCustomFont(font: .CircularStdBook, size: 12)
        }

    @IBAction func resetBtnClicked(_ sender: Any) {
        presentDetail(ForgotPasswordVC())
    }

    @IBAction func contineBtnClicked(_ sender: Any) {
        UIWindow.setRootViewController(viewController: MainTabBarVC())
    }

}
