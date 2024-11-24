//
//  ProductDetailsViewModel.swift
//  FashionApp
//
//  Created by Engy on 11/24/24.
//

import Foundation
class ProductDetailsViewModel {
    let networkManager = NetworkManager.shared
    var id: Int?
    var product: Product?
    var dataBinding:(()->())?



    // MARK: -  fetchDataFromNetwork
    func fetchDataFromNetwork() {
        guard let id = self.id else{return}
        let url = ShopifyAPI.product(id: id).shopifyURLString()
        networkManager.fetchData(from: url, responseType: ProductWrapper.self) { result in
            guard let product = result?.product else { return }
            self.product = product
            self.dataBinding?()
        }
    }


}
