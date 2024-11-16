//
//  ShopByCategoriesNameVC.swift
//  FashionApp
//
//  Created by Engy on 11/16/24.
//

import UIKit

class ShopByCategoriesNameVC: UIViewController {
    @IBOutlet var collectionView: UICollectionView!
    var collectionItems: [TopSellingModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollection()
        setupDumyData()

    }

    func setupCollection(){
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "TopSellingCVCell", bundle: nil), forCellWithReuseIdentifier: "TopSellingCVCell")
    }

    func setupDumyData() {
        collectionItems = [
            TopSellingModel(title: "Men's Harrington Jacket", price: "$148.00", image: "topsell1"),
            TopSellingModel(title: "Men's Casual T-Shirt", price: "$14.00", image: "topsell2"),
            TopSellingModel(title: "Unisex Hoodie", price: "$18.00", image: "topsell3"),
            TopSellingModel(title: "Leather Wallet", price: "$349.00", image: "topsell4"),
            TopSellingModel(title: "Classic Cap", price: "$50.00", image: "topsell5"),
            TopSellingModel(title: "Men's Harrington Jacket", price: "$148.00", image: "topsell6"),
            TopSellingModel(title: "Men's Casual T-Shirt", price: "$14.00", image: "topsell7"),
            TopSellingModel(title: "Unisex Hoodie", price: "$18.00", image: "topsell8"),
            TopSellingModel(title: "Leather Wallet", price: "$349.00", image: "topsell9"),
            TopSellingModel(title: "Unisex Hoodie", price: "$18.00", image: "topsell3"),
        ]
    }


}

extension ShopByCategoriesNameVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionItems.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopSellingCVCell", for: indexPath) as! TopSellingCVCell
        cell.config(collectionItems[indexPath.row])
        return cell
    }

}
extension ShopByCategoriesNameVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let numberOfCellInRow: CGFloat = 2
        let flowlayout = collectionViewLayout as!UICollectionViewFlowLayout

        let collectionViewWidth = collectionView.bounds.width
        let spacingBetweenCell = flowlayout.minimumLineSpacing*(numberOfCellInRow-1)
        let adjustWidth = collectionViewWidth-spacingBetweenCell
        let width = adjustWidth/numberOfCellInRow
        return CGSize(width: width-24, height: width*(281/161))

    }

}
