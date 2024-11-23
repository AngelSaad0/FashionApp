//
//  LoginPasswordVC.swift
//  FashionApp
//
//  Created by Engy on 11/14/24.
//

import UIKit

class LoginPasswordVC: UIViewController {
    @IBOutlet var passwordContainerView: UIView!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var forgotPasswordLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var continueButton: UIButton!
    @IBOutlet var resetPasswordButton: UIButton!

    var viewModel = LoginPasswordViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewModel()
        updateUI()
    }

    private func setupViewModel() {
        viewModel.displayMessage = { message in
            displayMessage(massage: message)
        }
        viewModel.onNaviagtion = {
            UIWindow.setRootViewController(viewController: MainTabBarVC())
        }
    }

    private func updateUI() {
        passwordContainerView.addCornerRadius(8)
        continueButton.addCornerRadius(20)
        titleLabel.setCustomFont(font: .CircularStdBold, size: 32)
        continueButton.setCustomFont(font: .CircularStdBook, size: 16)
        resetPasswordButton.setCustomFont(font: .CircularStdBold, size: 14)
        forgotPasswordLabel.setCustomFont(font: .CircularStdBook, size: 12)
        passwordTextField.setCustomFont(font: .CircularStdBook, size: 16)
    }

    @IBAction func resetBtnClicked(_ sender: Any) {
        presentDetail(ForgotPasswordVC())
    }

    @IBAction func contineBtnClicked(_ sender: Any) {
        guard let password = passwordTextField.text?.trimmingCharacters(in: .whitespaces), !password.isEmpty else {
            displayMessage(massage: .passwordEmpty)
            return
        }
        viewModel.checkPassword(password: password)
    }

    @IBAction func backButtonCliked(_ sender: Any) {
        dismissDetail()
    }

}
