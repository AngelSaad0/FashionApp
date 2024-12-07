//
//  LoginPasswordVC.swift
//  FashionApp
//
//  Created by Engy on 11/14/24.
//

import UIKit
import IQKeyboardManagerSwift

class LoginPasswordVC: UIViewController {
    @IBOutlet weak var passwordContainerView: UIView!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var forgetLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var continueButton: UIButton!
    @IBOutlet var resetButton: UIButton!
    var isHidden = true

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    // MARK: - Actions Methods
    @IBAction func resetBtnClicked(_ sender: Any) {
        presentDetail(ForgotPasswordVC())
    }

    @IBAction func contineBtnClicked(_ sender: Any) {
        UIWindow.setRootViewController(viewController: MainTabBarVC())
    }

    @IBAction func showOrHidePasswordButtonCliked(_ sender: UIButton) {
        isHidden.toggle()
        passwordTextField.isSecureTextEntry = isHidden
        sender.setImage(UIImage(systemName: isHidden ? "eye":"eye.slash"), for: .normal)
    }
}

// MARK: - Setup Methods
extension LoginPasswordVC {
    private func setupUI() {
        setupLabels()
        setupTextFields()
        setupButtons()
        setupContainerView()
        configureKeyboardManager()
    }
    private func setupLabels() {
        titleLabel.setCustomFont(font: .CircularStdBold, size: .extraExtraLarge)
        forgetLabel.setCustomFont(size: .extraSmall)
    }
    private func setupTextFields() {
        passwordTextField.setCustomFont(size: .medium)

    }
    private func setupButtons() {
        continueButton.addCornerRadius(20)
        resetButton.setCustomFont(font: .CircularStdBold, size: .small)
        continueButton.setCustomFont(size: .medium)

    }
    private func setupContainerView() {
        passwordContainerView.addCornerRadius(8)

    }
    private func configureKeyboardManager() {
        IQKeyboardManager.shared.resignOnTouchOutside = true
        IQKeyboardManager.shared.keyboardDistance = 10
        IQKeyboardManager.shared.layoutIfNeededOnUpdate = true
    }
}



