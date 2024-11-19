//
//  HomeVC.swift
//  FashionApp
//
//  Created by Engy on 11/15/24.
//


import UIKit

class HomeVC: UIViewController {
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var genderLbl: UILabel!
    @IBOutlet var gendeBtn: UIButton!
    @IBOutlet var arrowImg: UIImageView!
    @IBOutlet var collectionView: UICollectionView!
    let options = [ "Woman","Man", "Kids", "All"]
    var isDropdownVisible = false

    var catagoryCollection:[CategoryModel]  = catagoryDummyData
    var sectionTitle: [HomeHeaderModel] = []
    lazy var dropdownTableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupDummyData()
        setupCollection()
        setupDropdownTableView()
    }

    @IBAction func accountBtnClicked(_ sender: Any) {
        tabBarController?.selectedIndex = 3
    }

    @IBAction func cartBtnClicked(_ sender: Any) {
        presentDetail(CartVC())
    }

    @IBAction func genderBtnClicked(_ sender: Any) {
        toggleDropdown()
    }

}
extension HomeVC {

    private func setupUI() {
        genderLbl.setCustomFont(font: .GabaritoBold, size: 15)
    }

    private func setupTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(selectGenderTapped))
        view.addGestureRecognizer(tapGesture)
    }

    @objc func selectGenderTapped() {
        if isDropdownVisible {
            toggleDropdown()
        }
    }

    private func setupDropdownTableView() {
        dropdownTableView.delegate = self
        dropdownTableView.dataSource = self
        dropdownTableView.isHidden = true
        dropdownTableView.separatorStyle = .none
        dropdownTableView.layer.borderColor = UIColor.lightGray.cgColor
        dropdownTableView.backgroundColor = ._1_D_182_A
        dropdownTableView.layer.borderWidth = 1
        dropdownTableView.layer.cornerRadius = 8
        view.addSubview(dropdownTableView)
        dropdownTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dropdownTableView.topAnchor.constraint(equalTo: gendeBtn.bottomAnchor, constant: 5),
            dropdownTableView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dropdownTableView.widthAnchor.constraint(equalTo: gendeBtn.widthAnchor,multiplier: 0.6),
            dropdownTableView.heightAnchor.constraint(equalTo: gendeBtn.heightAnchor, multiplier: CGFloat(options.count))
        ])
    }
    private func toggleDropdown() {
        isDropdownVisible.toggle()
        dropdownTableView.isHidden = !isDropdownVisible
        updateDropdownButtonImage(isDropdownVisible: isDropdownVisible)
    }
    private func updateDropdownButtonImage(isDropdownVisible: Bool) {
        let arrowImageName = isDropdownVisible ? "arrowup" : "arrowdown"
        arrowImg.image = UIImage(named: arrowImageName)
    }

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
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.setCollectionViewLayout(layout, animated: true)
        collectionView.registerCVNib(cell: CategoriesCVCell.self)
        collectionView.registerCVNib(cell: TopSellingCVCell.self)
        collectionView.register(UINib(nibName: "HomeHeaderReusable", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HomeHeaderReusable")
    }


    private func setupDummyData() {
        sectionTitle = [
            HomeHeaderModel(title: .Categories, action: {
                self.presentDetail(ShopByCategoriesVC())
            }),
            HomeHeaderModel(title: .TopSelling, action: { self.presentDetail(ShopByCategoriesVC())}),
            HomeHeaderModel(title: .NewIn, action: { self.presentDetail(ShopByCategoriesVC())}),
        ]
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
            let cellA = collectionView.dequeueCVCell(for: indexPath, cell: CategoriesCVCell.self)!
            cellA.config(catagoryCollection[indexPath.row])
            return cellA

        case 1 :
            let cellB  = collectionView.dequeueCVCell(for: indexPath, cell: TopSellingCVCell.self)!
            cellB.config(productsList[indexPath.row])
            return cellB

        default:
            let cellC = collectionView.dequeueCVCell(for: indexPath, cell: TopSellingCVCell.self)!
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
extension HomeVC: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        options.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.contentView.backgroundColor = ._1_D_182_A
        cell.textLabel?.textColor = .label
        cell.textLabel?.text = options[indexPath.row]
        cell.textLabel?.setCustomFont(font: .GabaritoBold, size: 15)
        cell.textLabel?.textAlignment = .center
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        genderLbl.text =  options[indexPath.row]
        toggleDropdown()
    }


}
extension HomeVC: UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        presentDetail(SearchByNameVC())
    }
}

