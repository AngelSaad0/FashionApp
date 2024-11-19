//
//  ResetPasswordVC.swift
//  FashionApp
//
//  Created by Engy on 11/14/24.
//

import UIKit

class ResetPasswordVC: UIViewController {
    @IBOutlet var returnToLogin: UIButton!
    @IBOutlet var messageLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        returnToLogin.setCustomFont(font: .CircularStdBook, size: 16)
        messageLbl.setCustomFont(font: .CircularStdBook, size: 24)
        returnToLogin.addCornerRadius(20)
    }
    
    @IBAction func returnToLoginBtn(_ sender: Any) {
        UIWindow.setRootViewController(viewController: SignInVC())
    }
}
