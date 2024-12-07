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
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupCollectionView()
    }

    func setupUI() {
        titleLbl.setCustomFont(font: .GabaritoBold, size: .extraExtraLarge)
    }

    func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.registerCVNib(cell: TopSellingCVCell.self)
    }

    @IBAction func backBtnClicked(_ sender: Any) {
        dismissDetail()
    }

}

extension MyFavouritesVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {productsList.count}

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueCVCell(for: indexPath, cell: TopSellingCVCell.self)!
        cell.config(productsList[indexPath.row])
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
        return CGSize(width: width-24, height: width*(281/161))
    }
}
