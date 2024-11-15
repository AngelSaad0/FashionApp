//
//  CreateAccountVC.swift
//  FashionApp
//
//  Created by Engy on 11/14/24.
//

import UIKit

class CreateAccountVC: UIViewController {
    @IBOutlet var roundedView: [UIView]!


    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
    }

    private func updateUI() {
        roundedView.forEach{$0.layer.cornerRadius = 12}
        }

  

}
