//
//  NotificationsVC.swift
//  FashionApp
//
//  Created by Engy on 11/15/24.
//

import UIKit

class NotificationsVC: UIViewController {

    @IBOutlet var tableView: UITableView!
    var notivationArray:[CategoryModel] = [] {
        didSet{
            handelEmptyTable()
        }
    }
    lazy var messageView: HandleMessageView = {
        let  messageHeight: CGFloat = 300
        let centerMainView = UIScreen.main.bounds.height/2 - messageHeight/2
        let view = HandleMessageView(frame: CGRect(x: 0, y: centerMainView, width: UIScreen.main.bounds.width, height: messageHeight))
        view.confige(HandleMessageModel(message: .notification, action: {}))

        return view
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpDummyData()
        handelEmptyTable()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(UINib(nibName: "ShopByCategoriesTVCell", bundle: nil), forCellReuseIdentifier: "ShopByCategoriesTVCell")
    }


    func handelEmptyTable () {
        if notivationArray.isEmpty {
            if !view.subviews.contains(messageView) {
                view.addSubview(messageView)
            }
            tableView.isHidden = true
        } else {
            messageView.removeFromSuperview()
            tableView.isHidden = false
        }
    }

    func setUpDummyData() {
        notivationArray = [
            CategoryModel(title: "Gilbert, you placed and order check your order history for full details", image: "notification"),
            CategoryModel(title: "Gilbert, Thank you for shopping with us we have canceled order #24568.", image: "notificationbing"),
            CategoryModel(title: "Gilbert, your Order #24568 has been  confirmed check  your order history for full details", image: "notificationbing"),
            CategoryModel(title: "Gilbert, you placed and order check your order history for full details", image: "notificationbing"),

        ]

    }



}
extension NotificationsVC: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notivationArray.count

    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShopByCategoriesTVCell") as! ShopByCategoriesTVCell
        cell.config(notivationArray[indexPath.row])
        return cell

    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            notivationArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)

        }
    }


}
