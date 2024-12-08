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
    var wishlistData:[WishlistModel] = wishlistDummyData

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTableView()
    }

    func setupUI() {
        titleLbl.setCustomFont(font: .CircularStdBold, size: .size24)
    }

    func setupTableView() {
        tableview.delegate = self
        tableview.dataSource = self
        tableview.registerTVNib(cell: WishlistTVCell.self)
    }

    @IBAction func dismissButtonClicked(_ sender: Any) {
        dismissDetail()
    }
}

extension WishlistVC: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { wishlistData.count }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueTVCell(index: indexPath,cell: WishlistTVCell.self)
        cell.config(wishlistData[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {80}
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presentDetail(MyFavouritesVC())
    }
}

