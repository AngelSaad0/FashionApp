//
//  ForgotPasswordVC.swift
//  FashionApp
//
//  Created by Engy on 11/14/24.
//

import UIKit
import IQKeyboardManagerSwift

class ForgotPasswordVC: UIViewController {
    // MARK: - Outlets
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var emailContainerView: UIView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var continueButton: UIButton!

    // MARK: - Properties
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Actions Methods
    @IBAction func contineBtnclicked(_ sender: Any) {
        presentDetail(ResetPasswordVC())
    }

    @IBAction func dismissButtonClicked(_ sender: Any) {
        dismissDetail()
    }

}
// MARK: - Setup Methods
extension ForgotPasswordVC {
    private func setupUI() {
        setupLabels()
        setupTextFields()
        setupButtons()
        setupContainerView()
        configureKeyboardManager()
    }
    private func setupLabels() {
        titleLabel.customLabel(size: .size32, font: .GabaritoBold, text: .forgotPasswordLabel)
    }
    private func setupTextFields() {
        emailTextField.customTextField(placeholder: .password)
    }
    private func setupButtons() {
        continueButton.addCornerRadius(20)
        continueButton.customButton(title: .continue)
    }

    private func setupContainerView() {
        emailContainerView.addCornerRadius(8)
    }
    private func configureKeyboardManager() {
        IQKeyboardManager.shared.resignOnTouchOutside = true
        IQKeyboardManager.shared.keyboardDistance = 10
        IQKeyboardManager.shared.layoutIfNeededOnUpdate = true
    }

}
// MARK: - Helper Method
extension ForgotPasswordVC {

}
