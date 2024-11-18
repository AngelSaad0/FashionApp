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
        roundedView.forEach{$0.layer.cornerRadius = 12}
        continueBtn.layer.cornerRadius = 24
        continueBtn.setCircularBoldFont(size: 16)
        resetBtn.setCircularFont(size: 15)
        forgetLbl.setCircularFont(size: 12)
        allTxt.forEach{$0.setCircularFont(size: 16)}
        titleLbl.setCircularBoldFont(size: 32)

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
