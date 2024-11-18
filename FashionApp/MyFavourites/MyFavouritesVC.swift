//
//  MyFavouritesVC.swift
//  FashionApp
//
//  Created by Engy on 11/18/24.
//

import UIKit

class MyFavouritesVC: UIViewController {
    @IBOutlet var titleLbl: UILabel!
    @IBOutlet var collectionView: UICollectionView!
    var wishlistData: [TopSellingModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupDummyData()
        setupCollectionView()

    }

   func setupUI() {
       titleLbl.setGabaritoFont(size: 26)
    }

    func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "TopSellingCVCell", bundle: nil), forCellWithReuseIdentifier: "TopSellingCVCell")

    }
    func setupDummyData() {
        wishlistData = [
            TopSellingModel(title: "Men's Harrington Jacket", price: "$148.00", image: "topsell1", color: "Lemon", size: "M"),
                TopSellingModel(title: "Men's Casual T-Shirt", price: "$14.00", image: "topsell2", color: "White", size: "L"),
                TopSellingModel(title: "Unisex Hoodie", price: "$18.00", image: "topsell3", color: "Black", size: "XL"),
                TopSellingModel(title: "Leather Wallet", price: "$349.00", image: "topsell4", color: "Brown", size: "One Size"),
                TopSellingModel(title: "Classic Cap", price: "$50.00", image: "topsell5", color: "Navy Blue", size: "Adjustable"),
                TopSellingModel(title: "Men's Harrington Jacket", price: "$148.00", image: "topsell6", color: "Lemon", size: "M"),
                TopSellingModel(title: "Men's Casual T-Shirt", price: "$14.00", image: "topsell7", color: "Grey", size: "M"),
                TopSellingModel(title: "Unisex Hoodie", price: "$18.00", image: "topsell8", color: "Red", size: "L"),
                TopSellingModel(title: "Leather Wallet", price: "$349.00", image: "topsell9", color: "Black", size: "One Size")
        ]

    }



    @IBAction func backBtnClicked(_ sender: Any) {
                dismissDetail()

    }


}
extension MyFavouritesVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return wishlistData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopSellingCVCell", for: indexPath) as! TopSellingCVCell
        cell.config(wishlistData[indexPath.row])
        return cell
    }
    

}
extension MyFavouritesVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfCellInRow: CGFloat = 2
        let flowlayout = collectionViewLayout as!UICollectionViewFlowLayout
        let collectionViewWidth = collectionView.bounds.width
        let spacingBetweenCell = flowlayout.minimumLineSpacing*(numberOfCellInRow-1)
        let adjustWidth = collectionViewWidth-spacingBetweenCell
        let width = adjustWidth/numberOfCellInRow
        return CGSize(width: width-24, height: width*(281/161))    }
}