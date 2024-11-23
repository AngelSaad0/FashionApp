//
//  SignInVC.swift
//  FashionApp
//
//  Created by Engy on 11/14/24.
//

//otp
import UIKit

class SignInVC: UIViewController {

    @IBOutlet var emailContainerView: UIView!
    @IBOutlet var roundedContainerViews: [UIView]!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var haveAccountLabel: UILabel!
    @IBOutlet var continueWithLabels: [UILabel]!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var continueButton: UIButton!
    @IBOutlet var continueAsGuestButton: UIButton!
    @IBOutlet var createAccountButton: UIButton!

    var viewModel = SignInViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewModel()
        updateUI()
    }
    private func setupViewModel() {
        viewModel.onSignInSuccess = { [weak self] in
            DispatchQueue.main.async {
                self?.navigateToMainTabBar()
            }
        }
        viewModel.onSignInFailure = { [weak self] error in
            DispatchQueue.main.async {
                self?.showErrorAlert(message: "Failed: \(error?.localizedDescription ?? "")")
            }
        }
        viewModel.displayMessage = { massage in
            displayMessage(massage: massage)
        }
        viewModel.onNaviagtion = {
            DispatchQueue.main.async {
                self.presentDetail(LoginPasswordVC())
            }
        }
    }

    private func updateUI() {
        titleLabel.setCustomFont(font: .CircularStdBold, size: 32)
        emailTextField.setCustomFont(font: .CircularStdBook, size: 16)
        continueButton.setCustomFont(font: .CircularStdBook, size: 16)
        createAccountButton.setCustomFont(font: .CircularStdBold, size: 13)
        continueAsGuestButton.setCustomFont(font: .CircularStdBold, size: 13)
        continueWithLabels.forEach { $0.setCustomFont(font: .CircularStdBold, size: 16) }
        haveAccountLabel.setCustomFont(font: .CircularStdBook, size: 12)
        emailContainerView.addCornerRadius(8)
        roundedContainerViews.forEach { $0.addCornerRadius(20) }
    }

    private func navigateToMainTabBar() {
        UIWindow.setRootViewController(viewController: MainTabBarVC())
    }

    @IBAction func createAccountBtnClicked(_ sender: Any) {
        presentDetail(CreateAccountVC())
    }

    @IBAction func contineBtnClicked(_ sender: Any) {
        guard let email = emailTextField.text,!email.trimmingCharacters(in: .whitespaces).isEmpty else {
            displayMessage(massage: .emailEmpty)
            return
        }
        if isValidEmail(email) {
            viewModel.fetchDataFromNetwork(email: email)
        } else {
            displayMessage(massage: .emailValid)

        }    }

    @IBAction func continueWithAppleBtnClicked(_ sender: Any) {
        viewModel.signInWithApple()
    }

    @IBAction func continueWithGoogleBtnClicked(_ sender: Any) {
        viewModel.signInWithGoogle(presenting: self)
    }

    @IBAction func continueWithFacebookBtnClicked(_ sender: Any) {
        viewModel.signInWithFacebook(presenting: self)
    }

    @IBAction func continueAsGuestButtonCliked(_ sender: Any) {

        UIWindow.setRootViewController(viewController: MainTabBarVC())
    }


}
