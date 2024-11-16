//
//  ShopByCategoriesVC.swift
//  FashionApp
//
//  Created by Engy on 11/16/24.
//

import UIKit

class ShopByCategoriesVC: UIViewController {

    @IBOutlet var tableView: UITableView!
    var catagoryItems: [CategoryModel] = []


    override func viewDidLoad() {
        super.viewDidLoad()
        setupDummyData()
        setupTableView()
    }

    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ShopByCategoriesTVCell", bundle: nil), forCellReuseIdentifier: "ShopByCategoriesTVCell")
    }

    private func setupDummyData() {
        catagoryItems = [
            CategoryModel(title: "Hoodies", image: "Hoodies"),
            CategoryModel(title: "Shorts", image: "Shorts"),
            CategoryModel(title: "Shoes", image: "Shoes"),
            CategoryModel(title: "Bag", image: "Bag"),
            CategoryModel(title: "Accessories", image: "Accessories"),
            CategoryModel(title: "Hoodies", image: "Hoodies"),
            CategoryModel(title: "Shorts", image: "Shorts"),
            CategoryModel(title: "Shoes", image: "Shoes"),
            CategoryModel(title: "Bag", image: "Bag"),
            CategoryModel(title: "Accessories", image: "Accessories"),
        ]

    }


}

extension ShopByCategoriesVC: UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return catagoryItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShopByCategoriesTVCell") as! ShopByCategoriesTVCell
        cell.config(catagoryItems[indexPath.row])
        return cell

    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
    }

}
