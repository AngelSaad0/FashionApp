//
//  UICollectionView+Extension.swift
//  FashionApp
//
//  Created by Engy on 11/19/24.
//

import UIKit

extension UICollectionView {

   func registerCVNib<Cell: UICollectionViewCell>(cell: Cell.Type) {
       let nibName = String(describing: Cell.self)
       self.register(UINib(nibName: nibName, bundle: nil), forCellWithReuseIdentifier: nibName)
   }

   func dequeueCVCell<Cell: UICollectionViewCell>(for index: IndexPath) -> Cell {
       let identifier = String(describing: Cell.self)
       guard let cell = dequeueReusableCell(withReuseIdentifier: identifier, for: index) as? Cell else {
           fatalError("Error in dequeuing CV Cell")
       }
       return cell
   }
}

