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
    var settings = AccountSetting.allCases

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTableView()
    }

    private func setupUI() {
        cornerRaduisView.addCornerRadius(8)
        accountNameLbl.setCustomFont(font: .GabaritoBold, size: 16)
        phoneLbl.setCustomFont(font: .GabaritoBold, size: 16)
        editBtn.setCustomFont(font: .GabaritoBold, size: 12)
    }

    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerTVNib(cell: AccountTVCell.self)
    }

    @IBAction func editBtnClicked(_ sender: Any) {
        
    }

    @IBAction func signoutBtnClicked(_ sender: Any) {
        UIWindow.setRootViewController(viewController: SignInVC())
    }
}

extension AccountVC: UITableViewDelegate,UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueTVCell(index: indexPath,cell: AccountTVCell.self)
        cell.config(settings[indexPath.row].rawValue)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {64}

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
