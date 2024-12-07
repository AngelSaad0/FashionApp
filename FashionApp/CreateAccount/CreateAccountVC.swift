//
//  CreateAccountVC.swift
//  FashionApp
//
//  Created by Engy on 11/14/24.
//

import UIKit
import IQKeyboardManagerSwift


class CreateAccountVC: UIViewController {
    // MARK: - Outlets
    @IBOutlet var roundedContainerView: [UIView]!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var textFields: [UITextField]!
    @IBOutlet var firstNameTextField: UITextField!
    @IBOutlet var lastNameTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var continueButton: UIButton!
    @IBOutlet var forgetLabel: UILabel!
    @IBOutlet var resetButton: UIButton!
    // MARK: - Properties
    let userDefaultsManager = UserDefaultsManager.shared
    var isHidden =  true
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Actions Methods
    @IBAction func continueBtnClicked(_ sender: Any) {
        let validationChecks: [(Bool, ValidMessage)] = [
            (!(firstNameTextField.text?.isEmpty ?? true), .firstNameEmpty),
            (isValidName(firstNameTextField.text ?? ""), .firstNameInvalid),
            (!(lastNameTextField.text?.isEmpty ?? true), .lastNameEmpty),
            (isValidName(lastNameTextField.text ?? ""), .lastNameInvalid),
            (!(emailTextField.text?.isEmpty ?? true), .emailEmpty),
            (isValidEmail(emailTextField.text ?? ""), .emailInvalid),
            (!(passwordTextField.text?.isEmpty ?? true), .passwordEmpty),
            (isValidPassword(passwordTextField.text ?? ""), .passwordInvalid)
        ]
        for (isValid, errorMessage) in validationChecks {
            guard isValid else{
                displayMessage(massage: errorMessage)
                return
            }
        }
        saveData()
        presentDetail(AboutYourselfVC())
    }

    @IBAction func resetButtonClicked(_ sender: Any) {
        presentDetail(ForgotPasswordVC())
    }

    @IBAction func dismissButtonClicked(_ sender: Any) {
        dismissDetail()
    }
    @IBAction func showOrHidePasswordButtonCliked(_ sender: UIButton) {
        isHidden.toggle()
        passwordTextField.isSecureTextEntry = isHidden
        sender.setImage(UIImage(systemName: isHidden ? "eye":"eye.slash"), for: .normal)

    }
}
// MARK: - Setup Methods
extension CreateAccountVC {
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
        textFields.forEach{$0.setCustomFont(size: .medium)}
    }
    private func setupButtons() {
        continueButton.setCustomFont(font: .CircularStdBold, size: .medium)
        resetButton.setCustomFont(size: .small)
        continueButton.addCornerRadius(20)
    }
    private func setupContainerView() {
        roundedContainerView.forEach{$0.layer.cornerRadius = 12}
    }
    private func configureKeyboardManager() {
        IQKeyboardManager.shared.resignOnTouchOutside = true
        IQKeyboardManager.shared.keyboardDistance = 10
        IQKeyboardManager.shared.layoutIfNeededOnUpdate = true
    }


}
// MARK: - Helper Method
extension CreateAccountVC {
    private func saveData() {
        userDefaultsManager.isLogin = true
        userDefaultsManager.firstName = firstNameTextField.text ?? ""
        userDefaultsManager.lastName = lastNameTextField.text ?? ""
        userDefaultsManager.email = emailTextField.text ?? ""
        userDefaultsManager.password = passwordTextField.text ?? ""
        print("dddd")
        userDefaultsManager.storeData()
    }

}
