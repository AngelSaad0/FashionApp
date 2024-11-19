//
//  ShopByCategoriesVC.swift
//  FashionApp
//
//  Created by Engy on 11/16/24.
//

import UIKit

class ShopByCategoriesVC: UIViewController {
    @IBOutlet var tableView: UITableView!
    var catagoryItems: [CategoryModel] = catagoryDummyData
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }

    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerTVNib(cell: ShopByCategoriesTVCell.self)
    }

    @IBAction func backBtnClicked(_ sender: Any) {
        dismissDetail()
    }
}

extension ShopByCategoriesVC: UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { catagoryItems.count }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueTVCell(index: indexPath) as ShopByCategoriesTVCell
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
