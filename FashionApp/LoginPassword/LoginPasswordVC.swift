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
    @IBOutlet var continueBtn: UIButton!
    @IBOutlet var resetBtn: UIButton!
    @IBOutlet var titleLbl: UILabel!


    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    private func updateUI() {
        passwordView.layer.cornerRadius = 4
        titleLbl.setCircularBoldFont(size: 32)
        forgetLbl.setCircularFont(size: 12)
        forgetTxt.setCircularFont(size: 12)
        continueBtn.setCircularFont(size: 16)
        resetBtn.setCircularBoldFont(size: 15)
        }

    @IBAction func resetBtnClicked(_ sender: Any) {
        presentDetail(ForgotPasswordVC())
    }


    @IBAction func contineBtnClicked(_ sender: Any) {
        UIWindow.setRootViewController(viewController: MainTabBarVC())
    }
    

}
