//
//  HomeVC.swift
//  FashionApp
//
//  Created by Engy on 11/15/24.
//


import UIKit

class HomeVC: UIViewController{

    @IBOutlet var collectionView: UICollectionView!

    var catagoryCollection:[CategoryModel] = []
    var sectionTitle: [HomeHeaderModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupDummyData()
        setupCollection()
    }

    @IBAction func accountBtnClicked(_ sender: Any) {
        tabBarController?.selectedIndex = 3
    }

    @IBAction func cartBtnClicked(_ sender: Any) {
        presentDetail(CartVC())
    }
    
}

extension HomeVC : UICollectionViewDelegate,UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0 :
            return catagoryCollection.count
        case 1 :
            return productsList.count
        default:
            return productsList.count
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0 :
            let cellA = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoriesCVCell", for: indexPath) as! CategoriesCVCell
            cellA.config(catagoryCollection[indexPath.row])
            return cellA

        case 1 :
            let cellB = collectionView.dequeueReusableCell(withReuseIdentifier: "TopSellingCVCell", for: indexPath) as! TopSellingCVCell
            cellB.config(productsList[indexPath.row])
            return cellB

        default:
            let cellC = collectionView.dequeueReusableCell(withReuseIdentifier: "TopSellingCVCell", for: indexPath) as! TopSellingCVCell
            cellC.config(productsList[indexPath.row])
            return cellC
        }



    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc  = ProductDetailsVC()
        vc.detatails = productsList[indexPath.row]
        collectionView.deselectItem(at: [indexPath.row], animated: true)
        presentDetail(vc)
    }

    

}
extension HomeVC: UICollectionViewDelegateFlowLayout {

    func drawCategoriesSection() -> NSCollectionLayoutSection {
        let spacingBetweenGroup: CGFloat = 14
        let groupWidth: CGFloat =  65 + spacingBetweenGroup
        let groupHeight: CGFloat = groupWidth * (80 / 56)


        let itemSize = NSCollectionLayoutSize(widthDimension:.fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(groupWidth), heightDimension:  .absolute(groupHeight))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: spacingBetweenGroup)

        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous

        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 24, bottom: 10, trailing: 24-spacingBetweenGroup)


        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(20))
        let headerSupplementary = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)

        section.boundarySupplementaryItems = [headerSupplementary]

        return section
    }

    func drawTopSellingSection() -> NSCollectionLayoutSection {
        let spacingBetweenGroup: CGFloat = 12
        let groupWidth: CGFloat =  159 + spacingBetweenGroup
        let groupHeight: CGFloat = groupWidth * (281 / 159)

        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension:  .absolute(groupWidth), heightDimension: .absolute(groupHeight))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: spacingBetweenGroup)
        let section = NSCollectionLayoutSection(group: group)

        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 24, bottom: 16, trailing: 24 - spacingBetweenGroup)


        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(40))
        let headerSupplementary = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)

        section.boundarySupplementaryItems = [headerSupplementary]

        return section

    }

    func drawNewInSection() -> NSCollectionLayoutSection {
        return drawTopSellingSection()
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard kind == UICollectionView.elementKindSectionHeader else {
            return UICollectionReusableView()
        }
        if kind == UICollectionView.elementKindSectionHeader {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HomeHeaderReusable", for: indexPath) as! HomeHeaderReusable
            let item = sectionTitle[indexPath.section]
            header.config(item)
            return header
        }
        return UICollectionReusableView()
    }
}

extension HomeVC {

    private func setupCollection() {
        let layout = UICollectionViewCompositionalLayout {sectionIndex,_ in
            switch sectionIndex {
            case 0 :
                return self.drawCategoriesSection()
            case 1 :
                return self.drawTopSellingSection()
            default:
                return self.drawNewInSection()
            }
        }

        collectionView.setCollectionViewLayout(layout, animated: true)
        collectionView.register(UINib(nibName: "CategoriesCVCell", bundle: nil), forCellWithReuseIdentifier: "CategoriesCVCell")
        collectionView.register(UINib(nibName: "TopSellingCVCell", bundle: nil), forCellWithReuseIdentifier: "TopSellingCVCell")
        collectionView.register(UINib(nibName: "HomeHeaderReusable", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HomeHeaderReusable")


        collectionView.delegate = self
        collectionView.dataSource = self
    }

    private func setupDummyData() {
        sectionTitle = [
            HomeHeaderModel(title: "Categories", action: {
                self.presentDetail(ShopByCategoriesVC())
            }),
            HomeHeaderModel(title: "Top Selling", action: {}),
            HomeHeaderModel(title: "New In", action: {}),
        ]
        catagoryCollection = [
            CategoryModel(title: "Hoodies", image: "Hoodies"),
            CategoryModel(title: "Shorts", image: "Shorts"),
            CategoryModel(title: "Shoes", image: "Shoes"),
            CategoryModel(title: "Bag", image: "Bag"),
            CategoryModel(title: "Accessories", image: "Accessories"),
            CategoryModel(title: "Hoodies", image: "Hoodies"),
            CategoryModel(title: "Shorts", image: "Shorts"),
            CategoryModel(title: "Shoes", image: "Shoes"),
            CategoryModel(title: "Bag", image: "Bag"),
            CategoryModel(title: "Accessories", image: "Accessories"),
        ]


    }


}

