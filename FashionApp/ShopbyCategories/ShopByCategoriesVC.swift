//
//  ShopByCategoriesVC.swift
//  FashionApp
//
//  Created by Engy on 11/16/24.
//

import UIKit

class ShopByCategoriesVC: UIViewController {
    @IBOutlet var titleLbl: UILabel!
    @IBOutlet var tableView: UITableView!
    var catagoryItems = Category.allCases

    override func viewDidLoad() {
        super.viewDidLoad()
        titleLbl.setCustomFont(font: .GabaritoBold, size: .size32)
        setupTableView()
    }

    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerTVNib(cell: ShopByCategoriesTVCell.self)
    }

    @IBAction func dismissButtonClicked(_ sender: Any) {
        dismissDetail()
    }
}

extension ShopByCategoriesVC: UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { catagoryItems.count }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueTVCell(index: indexPath, cell: ShopByCategoriesTVCell.self)
        cell.config(catagoryItems[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        72
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presentDetail(ShopByCategoriesNameVC())
    }

}
