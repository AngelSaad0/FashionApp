//
//  HomeViewModel.swift
//  FashionApp
//
//  Created by Engy on 11/22/24.
//

import Foundation
import UIKit
class HomeViewModel {
    let options = Gender.allCases
    let catagoryCollection = Category.allCases
    var sectionTitle: [HomeHeaderModel]?
    var onNavigate:((HomeSectionType) -> Void)?

     func setupCollectionHeaderData() {
        sectionTitle = [
            HomeHeaderModel(title: .categories, action: { [weak self] in
                self?.onNavigate?(.categories)
            }),
            HomeHeaderModel(title: .topSelling, action: { [weak self] in
                self?.onNavigate?(.topSelling)
            }),
            HomeHeaderModel(title: .newIn, action: { [weak self] in
                self?.onNavigate?(.newIn)
            }),
        ]
    }


}
