//
//  AccountVC.swift
//  FashionApp
//
//  Created by Engy on 11/15/24.
//

import UIKit

class AccountVC: UIViewController {

    @IBOutlet var accountImg: UIImageView!
    @IBOutlet var accountNameLbl: UILabel!
    @IBOutlet var emailLbl: UILabel!
    @IBOutlet var phoneLbl: UILabel!
    @IBOutlet var cornerRaduisView: UIView!
    @IBOutlet var editBtn: UIButton!
    @IBOutlet var signOutBtn: UIButton!
    @IBOutlet var tableView: UITableView!

    var settingArray:[String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupDummyData()
        setupTableView()

    }

    private func setupUI() {
        cornerRaduisView.layer.cornerRadius = 8
        accountNameLbl.setGabaritoFont(size: 16)
        phoneLbl.setCircularFont(size: 16)
        accountNameLbl.setGabaritoFont(size: 16)
        editBtn.setGabaritoFont(size: 12)
        signOutBtn.setGabaritoFont(size: 16)


    }
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "AccountTVCell", bundle: nil), forCellReuseIdentifier: "AccountTVCell")
    }

    @IBAction func editBtnClicked(_ sender: Any) {
    }
    
    @IBAction func signoutBtnClicked(_ sender: Any) {
        UIWindow.setRootViewController(viewController: SignInVC())
    }

}

extension AccountVC: UITableViewDelegate,UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AccountTVCell") as! AccountTVCell
        cell.config(settingArray[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0 : presentDetail(AddressVC())
        case 1 : presentDetail(WishlistVC())
        case 2 : presentDetail(PaymentVC())
        case 3 : presentDetail(HelpVC())
        case 4: presentDetail(SupportVC())
        default: return

        }
    }
}

extension AccountVC {

    func setupDummyData() {
        settingArray = ["Address","Wishlist","Payment","Help","Support"]
    }
}
