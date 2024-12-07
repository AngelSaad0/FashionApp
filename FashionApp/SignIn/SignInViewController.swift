//
//  SignInVC.swift
//  FashionApp
//
//  Created by Engy on 11/14/24.
//

import UIKit
import IQKeyboardManagerSwift

class SignInViewController: UIViewController {

    @IBOutlet var emailContainerView: UIView!
    @IBOutlet var roundedViews: [UIView]!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var haveAccountLabel: UILabel!
    @IBOutlet var continueWithLabels: [UILabel]!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var continueButton: UIButton!
    @IBOutlet var createAccountButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    @IBAction func createAccountBtnClicked(_ sender: Any) {
        presentDetail(CreateAccountVC())
    }

    @IBAction func contineBtnClicked(_ sender: Any) {
        let validationChecks: [(Bool, ValidMessage)] = [
            (!(emailTextField.text?.isEmpty ?? true), .emailEmpty),
            (isValidEmail(emailTextField.text ?? ""), .emailInvalid),
        ]
        for (isValid, errorMessage) in validationChecks {
            guard isValid else{
                displayMessage(massage: errorMessage)
                return
            }
        }
        checkUserData() ? presentDetail(LoginPasswordVC()) : displayMessage(massage: .emailDoesNotExist)

    }

    @IBAction func continueWithAppleBtnClicked(_ sender: Any) {
        displayMessage(massage: .notAvailable)
    }

    @IBAction func continueWithGoogleBtnClicked(_ sender: Any) {
        displayMessage(massage: .notAvailable)
    }

    @IBAction func continueWithFacebookBtnClicked(_ sender: Any) {
        displayMessage(massage: .notAvailable)
    }
}
// MARK: - Setup Methods
extension SignInViewController {
    private func setupUI() {
        setupLabels()
        setupTextFields()
        setupButtons()
        setupContainerView()
        configureKeyboardManager()
    }
    private func setupLabels() {
        titleLabel.setCustomFont(size: .extraExtraLarge)
        continueWithLabels.forEach{$0.setCustomFont(font: .CircularStdBold, size: .medium)}
        haveAccountLabel.setCustomFont(size: .extraSmall)

    }
    private func setupTextFields() {
        emailTextField.setCustomFont(size: .medium)

    }
    private func setupButtons() {
        continueButton.setCustomFont(size: .medium)
        createAccountButton.setCustomFont(font: .CircularStdBold, size: .small)

    }

    private func setupContainerView() {
        emailContainerView.addCornerRadius(8)
        roundedViews.forEach{$0.addCornerRadius(20)}
    }
    private func configureKeyboardManager() {
        IQKeyboardManager.shared.resignOnTouchOutside = true
        IQKeyboardManager.shared.keyboardDistance = 10
        IQKeyboardManager.shared.layoutIfNeededOnUpdate = true
    }
}
// MARK: - Helper Methods
extension SignInViewController {
    private func checkUserData()-> Bool {
        return UserDefaultsManager.shared.email == emailTextField.text! ?  true : false
    }

}
