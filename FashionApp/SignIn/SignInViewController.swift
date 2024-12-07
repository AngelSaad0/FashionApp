//
//  SignInVC.swift
//  FashionApp
//
//  Created by Engy on 11/14/24.
//

import UIKit

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
        updateUI()
    }

    private func updateUI() {
        titleLabel.setCustomFont(size: .extraExtraLarge)
        emailTextField.setCustomFont(size: .medium)
        continueButton.setCustomFont(size: .medium)
        createAccountButton.setCustomFont(font: .CircularStdBold, size: .small)
        continueWithLabels.forEach{$0.setCustomFont(font: .CircularStdBold, size: .medium)}
        haveAccountLabel.setCustomFont(size: .extraSmall)
        emailContainerView.addCornerRadius(8)
        roundedViews.forEach{$0.addCornerRadius(20)}
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
