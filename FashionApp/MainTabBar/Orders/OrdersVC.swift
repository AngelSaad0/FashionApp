//
//  OrdersVC.swift
//  FashionApp
//
//  Created by Engy on 11/15/24.
//

import UIKit

class OrdersVC: UIViewController {

    @IBOutlet var collectionView: UICollectionView!
    var statuses:[OrdersStateModel] = []
    var selectedStatusIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        setupDummyData()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "OrdersCVCell", bundle: nil), forCellWithReuseIdentifier: "OrdersCVCell")
    }

    private func setupDummyData() {
        statuses = [
            OrdersStateModel(state: true, title: "Processing", action: {print("Processing")}),
            OrdersStateModel(state: false, title: "Shipped", action: {print("Shipped")}),
            OrdersStateModel(state: false, title: "Delivered", action: {}),
            OrdersStateModel(state: false, title: "Returned", action: {}),
            OrdersStateModel(state: false, title: "Cancelled", action: {}),
        ]
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
