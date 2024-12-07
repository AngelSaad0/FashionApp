//
//  CreateAccountVC.swift
//  FashionApp
//
//  Created by Engy on 11/14/24.
//

import UIKit

class CreateAccountVC: UIViewController {
    @IBOutlet var roundedView: [UIView]!
    @IBOutlet var titleLbl: UILabel!
    @IBOutlet var allTxt: [UITextField]!
    @IBOutlet var continueBtn: UIButton!
    @IBOutlet var forgetLbl: UILabel!
    @IBOutlet var resetBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    private func updateUI() {
        continueBtn.addCornerRadius(20)
        roundedView.forEach{$0.layer.cornerRadius = 12}
        titleLbl.setCustomFont(font: .CircularStdBold, size: .extraExtraLarge)
        continueBtn.setCustomFont(font: .CircularStdBold, size: .medium)
        allTxt.forEach{$0.setCustomFont(size: .medium)}
        resetBtn.setCustomFont(size: .small)
        forgetLbl.setCustomFont(size: .extraSmall)

        }

    @IBAction func continueBtnClicked(_ sender: Any) {
        presentDetail(AboutYourselfVC())
    }
    
    @IBAction func resetBtnClicked(_ sender: Any) {
        presentDetail(ForgotPasswordVC())
    }


    @IBAction func backBtnClicked(_ sender: Any) {
        dismissDetail()
    }
    
  

}
