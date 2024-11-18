//
//  WishlistVC.swift
//  FashionApp
//
//  Created by Engy on 11/17/24.
//

import UIKit

class WishlistVC: UIViewController {
    
    @IBOutlet var titleLbl: UILabel!
    @IBOutlet var tableview: UITableView!
    var wishlistData: [WishlistItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupDummyData()
        setupTableView()
    }
    
    func setupUI() {
        titleLbl.setCircularBoldFont(size: 24)
    }
    
    func setupTableView() {
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(UINib(nibName: "WishlistTVCell", bundle: nil), forCellReuseIdentifier: "WishlistTVCell")

    }
    
    func setupDummyData() {
        wishlistData = [
            WishlistItem(title: "My Favorite", productCount: 12),
            WishlistItem(title: "T-Shirts", productCount: 4),
            WishlistItem(title: "Sneakers", productCount: 7),
            WishlistItem(title: "Accessories", productCount: 3),
            WishlistItem(title: "Hoodies", productCount: 5),
            WishlistItem(title: "Jeans", productCount: 6),
            WishlistItem(title: "Jackets", productCount: 2),
            WishlistItem(title: "Dresses", productCount: 9),
            WishlistItem(title: "Watches", productCount: 4),
            WishlistItem(title: "Sunglasses", productCount: 8),
            WishlistItem(title: "Bags", productCount: 10)
        ]
    }

    @IBAction func backBtnClicked(_ sender: Any) {
                dismissDetail()

    }

}
extension WishlistVC: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        wishlistData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WishlistTVCell") as! WishlistTVCell
        cell.config(wishlistData[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presentDetail(MyFavouritesVC())
    }


}

