//
//  LoginVC.swift
//  FashionApp
//
//  Created by Engy on 11/14/24.
//

import UIKit

class LoginVC: UIViewController {
    @IBOutlet var emailView: UIView!
    @IBOutlet var roundedView: [UIView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()

    }

    private func updateUI() {
        emailView.layer.cornerRadius = 4
        roundedView.forEach{$0.layer.cornerRadius = 20}
        }

   
}
