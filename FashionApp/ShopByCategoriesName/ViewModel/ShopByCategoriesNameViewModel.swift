//
//  ShopByCategoriesNameViewModel.swift
//  FashionApp
//
//  Created by Engy on 11/23/24.
//

import Foundation
class ShopByCategoriesNameViewModel {
    var productsList:[Product] = []
    var title:String = ""
    var dataBinding:(()->())?
    let networkManager = NetworkManager.shared
    
    // MARK: -  fetchDataFromNetwork
    func fetchDataFromNetwork() {
        guard  productsList.isEmpty else{return}
        let url = ShopifyAPI.products.shopifyURLString()
        networkManager.fetchData(from: url, responseType: Products.self) { result in
            guard let products = result else { return }
            self.productsList = products.products.filter{$0.vendor.contains(self.title)}
            self.dataBinding?()
        }
    }
}
