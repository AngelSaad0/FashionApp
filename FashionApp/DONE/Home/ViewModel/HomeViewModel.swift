//
//  HomeViewModel.swift
//  FashionApp
//
//  Created by Engy on 11/22/24.
//

import Foundation
import UIKit
import Alamofire
class HomeViewModel {
    // MARK: - Properties
    private var networkManager: NetworkManagerProtocol
    private var connectivityService: ConnectivityServiceProtocol

    let options = Gender.allCases
    let newtworkManager = NetworkManager.shared
    var catagoryArray:[SmartCollection] = []
    var topSellingFillterArray:[Product] = []
    var newInArray:[Product] = []
    var topSellingArray:[Product] = []
    var onNavigate:((HomeSectionType) -> Void)?
    var bindData:(() -> ())?
    var sectionTitle: [HomeHeaderModel]?
    var userGender = UserDefaultsManager.shared.gender.lowercased()
    // MARK: - Initializer
    init() {
        networkManager = NetworkManager.shared
        connectivityService = ConnectivityService.shared
    }

    func checkConnectivity( completion: @escaping (Bool) -> Void) {
        connectivityService.checkInternetConnection { isConnected in
            DispatchQueue.main.async {
                completion(isConnected)
            }
        }
    }
    func  setSelectedGender(index:Int) {
        userGender = options[index].rawValue.lowercased()
        saveDataInUserDefaults()

        loadNewIn()
        loadTopSelling()
    }

    func saveDataInUserDefaults () {
        UserDefaultsManager.shared.gender = userGender
        UserDefaultsManager.shared.storeData()

    }

    func setupCollectionHeaderData() {
        sectionTitle = [
            HomeHeaderModel(title: .brands, action: { [weak self] in
                self?.onNavigate?(.brands)
            }),
            HomeHeaderModel(title: .topSelling, action: { [weak self] in
                self?.onNavigate?(.topSelling)
            }),
            HomeHeaderModel(title: .newIn, action: { [weak self] in
                self?.onNavigate?(.newIn)
            }),
        ]
    }


    func loadBrands() {
        let url = ShopifyAPI.smartCollections.shopifyURLString()
        newtworkManager.fetchData(from:url , responseType: BrandsCollection.self) {[weak self] result in
            guard let self = self, let brands = result else { return }
            self.catagoryArray = brands.smartCollections
            self.bindData?()
        }
    }
    func loadTopSelling() {
        let url = ShopifyAPI.products.shopifyURLString()
        let gender = userGender==Gender.all.rawValue.lowercased() ?  " ":userGender
        newtworkManager.fetchData(from:url , responseType: Products.self) {[weak self] result in
            guard let self = self, let product = result else { return }
            self.topSellingArray = product.products.filter { $0.tags.contains(gender)}
            self.bindData?()
        }
    }
    func loadNewIn() {
        let url = ShopifyAPI.products.shopifyURLString()
        let gender = userGender==Gender.all.rawValue.lowercased() ?  " ":userGender
        newtworkManager.fetchData(from:url , responseType: Products.self) {[weak self] result in
            guard let self = self, let product = result else { return }
            let filtterArray = product.products.filter{Double($0.variants.first?.price ?? "0") ?? 0 > 100}.shuffled()
            newInArray = filtterArray.filter { $0.tags.contains(gender)}
            self.bindData?()
        }
    }


}
