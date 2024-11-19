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
    var filltersOrders:[OrdersModel] = [] {
        didSet{
            handelEmptyTable()
        }
    }

    lazy var messageView: HandleMessageView = {
        let view = HandleMessageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.confige(HandleMessageModel(message: .order, action: {}))
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    private func setupUI() {
        filltersOrders = orders
        handelEmptyTable()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.registerCVNib(cell: OrdersCVCell.self)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerTVNib(cell: OrdersTVCell.self)
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
        let cell = collectionView.dequeueCVCell(for: indexPath,cell: OrdersCVCell.self)!
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
        let cell = tableView.dequeueTVCell(index: indexPath,cell: OrdersTVCell.self)
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

