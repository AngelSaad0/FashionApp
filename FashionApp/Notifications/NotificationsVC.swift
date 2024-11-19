//
//  NotificationsVC.swift
//  FashionApp
//
//  Created by Engy on 11/15/24.
//

import UIKit

class NotificationsVC: UIViewController {

    @IBOutlet var tableView: UITableView!
    var notivationData:[CategoryModel] = notivationDummyData {
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
        handelEmptyTable()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.registerTVNib(cell: ShopByCategoriesTVCell.self)
    }

    func handelEmptyTable () {
        if notivationData.isEmpty {
            if !view.subviews.contains(messageView) {
                view.addSubview(messageView)
            }
            tableView.isHidden = true
        } else {
            messageView.removeFromSuperview()
            tableView.isHidden = false
        }
    }

}
extension NotificationsVC: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notivationData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueTVCell(index: indexPath) as! ShopByCategoriesTVCell
        cell.config(notivationData[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         80
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            notivationData.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
