//
//  OrdersVC.swift
//  FashionApp
//
//  Created by Engy on 11/15/24.
//

import UIKit

class OrdersVC: UIViewController {

    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var tableView: UITableView!

    var statuses: [OrdersStateModel] = []
    var orders: [OrdersModel] = []

    var filltersOrders:[OrdersModel] = [] {
           didSet{
               handelEmptyTable()
           }
       }

    lazy var messageView: HandleMessageView = {
        let view = HandleMessageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.confige(HandleMessageModel(message: .notification, action: {}))
        return view
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        setupDummyData()
        filltersOrders = orders
        handelEmptyTable()

        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "OrdersCVCell", bundle: nil), forCellWithReuseIdentifier: "OrdersCVCell")

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "OrdersTVCell", bundle: nil), forCellReuseIdentifier: "OrdersTVCell")
    }

    private func setupMessageViewConstraint() {

        NSLayoutConstraint.activate([
            messageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            messageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            messageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            messageView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }


    func handelEmptyTable () {
        if filltersOrders.isEmpty {
            if !view.subviews.contains(messageView) {
                view.addSubview(messageView)
                setupMessageViewConstraint()
            }
            tableView.isHidden = true
        } else {
            messageView.removeFromSuperview()
            tableView.isHidden = false
        }
    }

    func fillterReuslts(index:Int) {
        let status = statuses[index].stateTitle
        if status == .Processing {
            filltersOrders = orders
        } else {
            filltersOrders = orders.filter{$0.status == status}
        }

        tableView.reloadData()

    }
}
extension OrdersVC: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return statuses.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OrdersCVCell", for: indexPath) as! OrdersCVCell
        cell.confige(statuses[indexPath.row])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        for index in statuses.indices {
            statuses[index].state = false
        }
        statuses[indexPath.row].state = true
        fillterReuslts(index: indexPath.row)
        collectionView.reloadData()
    }


}
extension OrdersVC: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width: CGFloat = 83
        let height: CGFloat = collectionView.bounds.height
        return CGSize(width: width, height: height)
    }
}

extension OrdersVC: UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filltersOrders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrdersTVCell") as! OrdersTVCell
        cell.config(filltersOrders[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 84
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc  = OrderDetailsVC()
        vc.orderDetails = orders[indexPath.row]
        presentDetail(vc)
    }



}

extension OrdersVC {

    private func setupDummyData() {
        statuses = [
            OrdersStateModel(state: true, stateTitle: .Processing),
            OrdersStateModel(state: false, stateTitle: .Shipped),
            OrdersStateModel(state: false, stateTitle: .Delivered),
            OrdersStateModel(state: false, stateTitle: .Returned),
            OrdersStateModel(state: false, stateTitle: .Cancelled),
        ]

        orders = [
            OrdersModel(
                id: 456765,
                orderNumber: 1001,
                orderCount: 4,
                phoneNumber: "1234567890",
                address: "123 Main Street, City Center",
                orderDate: "2024-11-12",
                status: .Placed
            ),
            OrdersModel(
                id: 959765,
                orderNumber: 1002,
                orderCount: 1,
                phoneNumber: "9876543210",
                address: "456 Avenue, Suburb",
                orderDate: "2024-11-12",
                status: .Confirmed
            ),
            OrdersModel(
                id: 856765,
                orderNumber: 1003,
                orderCount: 5,
                phoneNumber: "5555555555",
                address: "789 Boulevard, Uptown",
                orderDate: "2024-11-12",
                status: .Shipped
            ),
            OrdersModel(
                id: 756765,
                orderNumber: 1004,
                orderCount: 1,
                phoneNumber: "1111111111",
                address: "321 Road, Downtown",
                orderDate: "2024-11-12",
                status: .Delivered
            ),
            OrdersModel(
                id: 656765,
                orderNumber: 1005,
                orderCount: 4,
                phoneNumber: "2222222222",
                address: "654 Lane, Countryside",
                orderDate: "2024-11-12",
                status: .Returned
            ),
//            OrdersModel(
//                id: 546765,
//                orderNumber: 1006,
//                orderCount: 3,
//                phoneNumber: "3333333333",
//                address: "987 Street, Seaside",
//                orderDate: "2024-11-12",
//                status: .Cancelled
//            ),
            OrdersModel(
                id: 436765,
                orderNumber: 1007,
                orderCount: 2,
                phoneNumber: "4444444444",
                address: "159 High Street, City Center",
                orderDate: "2024-11-12",
                status: .Placed
            ),
            OrdersModel(
                id: 326765,
                orderNumber: 1008,
                orderCount: 6,
                phoneNumber: "5555555555",
                address: "753 Hill Road, Uptown",
                orderDate: "2024-11-12",
                status: .Shipped
            ),
            OrdersModel(
                id: 216765,
                orderNumber: 1009,
                orderCount: 1,
                phoneNumber: "6666666666",
                address: "852 Valley Street, Suburb",
                orderDate: "2024-11-12",
                status: .Delivered
            ),
            OrdersModel(
                id: 106765,
                orderNumber: 1010,
                orderCount: 3,
                phoneNumber: "7777777777",
                address: "951 Sunset Avenue, Countryside",
                orderDate: "2024-11-12",
                status: .Confirmed
            ),
            OrdersModel(
                id: 986765,
                orderNumber: 1011,
                orderCount: 2,
                phoneNumber: "8888888888",
                address: "369 Forest Lane, Mountainside",
                orderDate: "2024-11-12",
                status: .Returned
            ),
//            OrdersModel(
//                id: 876765,
//                orderNumber: 1012,
//                orderCount: 5,
//                phoneNumber: "9999999999",
//                address: "147 River Road, Lakeside",
//                orderDate: "2024-11-12",
//                status: .Cancelled
//            )
        ]

    }

}
