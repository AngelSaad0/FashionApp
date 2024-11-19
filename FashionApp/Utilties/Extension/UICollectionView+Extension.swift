//
//  UICollectionView+Extension.swift
//  FashionApp
//
//  Created by Engy on 11/19/24.
//

import UIKit

extension UICollectionView {

    func registerCVNib<Cell: UICollectionViewCell>(cell: Cell.Type) {
        let nibName = String(describing: cell.self)
        if Bundle.main.path(forResource: nibName, ofType: "nib") != nil {
            self.register(UINib(nibName: nibName, bundle: nil), forCellWithReuseIdentifier: nibName)
        } else {
            print("Warning: Nib file for \(nibName) not found.")
        }
    }

    func dequeueCVCell<Cell: UICollectionViewCell>(for index: IndexPath,cell: Cell.Type) -> Cell? {
        let identifier = String(describing: cell.self)

        guard let cell = dequeueReusableCell(withReuseIdentifier: identifier, for: index) as? Cell else {fatalError("Error in dequeue CV Cell")}
        return cell
    }
}


