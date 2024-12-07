//
//  AddressVC.swift
//  FashionApp
//
//  Created by Engy on 11/17/24.
//

import UIKit

class AddressVC: UIViewController {

    @IBOutlet var titleLbl: UILabel!
    @IBOutlet var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTableView()
    }

    func setupUI() {
        titleLbl.setCustomFont(font: .CircularStdBold, size: .extraLarge)
    }

    func setupTableView() {
        tableview.delegate = self
        tableview.dataSource = self
        tableview.registerTVNib(cell: AddressTVCell.self)
    }

    @IBAction func backBtnClicked(_ sender: Any) {
        dismissDetail()
    }

}
extension AddressVC: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dummyAddresses.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueTVCell(index: indexPath,cell: AddressTVCell.self)
        cell.config(dummyAddresses[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        86
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presentDetail(AddAddressVC())
    }

}
