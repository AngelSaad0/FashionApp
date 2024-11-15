//
//  LoginPasswordVC.swift
//  FashionApp
//
//  Created by Engy on 11/14/24.
//

import UIKit

class LoginPasswordVC: UIViewController {
    @IBOutlet weak var passwordView: UIView!


    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    private func updateUI() {
        passwordView.layer.cornerRadius = 4
        }

}
