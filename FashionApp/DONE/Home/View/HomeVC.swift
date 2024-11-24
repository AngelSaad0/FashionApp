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
    var isDropdownVisible = false
    lazy var dropdownTableView = UITableView()

    let viewModel = HomeViewModel()
    lazy var messageView: HandleMessageView = {
        let  messageHeight: CGFloat = 300
        let centerMainView = UIScreen.main.bounds.height/2 - messageHeight/2
        let view = HandleMessageView(frame: CGRect(x: 0, y: centerMainView+100, width: UIScreen.main.bounds.width, height: messageHeight))
        view.massageBtn.isHidden = true
        view.confige(HandleMessageModel(message: .outOfStock, action: {}))
        return view
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupViewModel()
        setupCollection()
        setupDropdownTableView()
    }

    func handelEmptyCollection() {
        if viewModel.topSellingArray.isEmpty {
            if !view.subviews.contains(messageView) {
                view.addSubview(messageView)
            }
        } else {
            messageView.removeFromSuperview()
        }
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
    private func setupViewModel() {
        viewModel.setupCollectionHeaderData()
        viewModel.bindData = {
            self.collectionView.reloadData()
            self.handelEmptyCollection()
        }
        viewModel.onNavigate = { type in
            switch type {
            case .brands:
                let vc = ShopByCategoriesVC()
                vc.viewModel.brandList = self.viewModel.catagoryArray
                self.presentDetail(vc)
            case .topSelling:
                let vc = ShopByCategoriesNameVC()
                vc.viewModel.title = type.rawValue
                vc.viewModel.productsList = self.viewModel.topSellingArray
                self.presentDetail(vc)
            case .newIn:
                let vc = ShopByCategoriesNameVC()
                vc.viewModel.title = type.rawValue
                vc.viewModel.productsList = self.viewModel.newInArray
                self.presentDetail(vc)
            }
        }
        viewModel.checkConnectivity { [weak self] isConnected in
            self?.collectionView.isHidden =  !isConnected
            DispatchQueue.main.async {
                if isConnected {
                    self?.view.removeEmptyMessage()
                    self?.viewModel.loadBrands()
                    self?.viewModel.loadNewIn()
                    self?.viewModel.loadTopSelling()
                } else {
                    self?.view.displayEmptyMessage("No Internet")
                    self?.showNoInternetAlert()
                }
            }
        }
    }

    private func setupUI() {
        genderLbl.text = viewModel.userGender.capitalized
        genderLbl.setCustomFont(font: .GabaritoBold, size: 15)
    }

    private func setupCollection() {
        collectionView.delegate = self
        collectionView.dataSource = self
        setupCompositionalLayout()
        collectionView.registerCVNib(cell: CategoriesCVCell.self)
        collectionView.registerCVNib(cell: TopSellingCVCell.self)
        collectionView.registerSupplementaryView(view: HomeHeaderReusable.self, kind: UICollectionView.elementKindSectionHeader)
    }

    private func setupCompositionalLayout() {
        let layout = UICollectionViewCompositionalLayout {sectionIndex,_ in
            switch sectionIndex {
            case 0 :
                return self.drawBrandsSection()
            case 1 :
                return self.drawTopSellingSection()
            default:
                return self.drawNewInSection()
            }
        }
        collectionView.setCollectionViewLayout(layout, animated: true)

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
            dropdownTableView.heightAnchor.constraint(equalTo: gendeBtn.heightAnchor, multiplier: CGFloat(viewModel.options.count))
        ])
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

    private func toggleDropdown() {
        isDropdownVisible.toggle()
        dropdownTableView.isHidden = !isDropdownVisible
        updateDropdownButtonImage(isDropdownVisible: isDropdownVisible)
    }
    private func updateDropdownButtonImage(isDropdownVisible: Bool) {
        let arrowImageName = isDropdownVisible ? Assets.arrowup.rawValue : Assets.arrowdown.rawValue
        arrowImg.image = UIImage(named: arrowImageName)
    }
}
// MARK: -  UICollectionViewDelegate
extension HomeVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            let vc = ShopByCategoriesNameVC()
            vc.viewModel.title = viewModel.catagoryArray[indexPath.row].title
            presentDetail(vc)
        case 1:
            let vc = ProductDetailsVC()
            vc.viewModel.id = viewModel.topSellingArray[indexPath.row].id
            presentDetail(vc)
        case 2:
            let vc = ProductDetailsVC()
            vc.viewModel.id = viewModel.newInArray[indexPath.row].id
            presentDetail(vc)
        default:return
        }
    }
}
// MARK: -  UICollectionViewDataSource
extension HomeVC :UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0 :
            return viewModel.catagoryArray.count
        case 1 :
            return viewModel.topSellingArray.count
        default:
            return viewModel.newInArray.count
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0 :
            let cellA = collectionView.dequeueCVCell(for: indexPath, cell: CategoriesCVCell.self)!
            cellA.config(viewModel.catagoryArray[indexPath.row])
            return cellA

        case 1 :
            let cellB  = collectionView.dequeueCVCell(for: indexPath, cell: TopSellingCVCell.self)!
            cellB.config(viewModel.topSellingArray[indexPath.row])
            return cellB

        default:
            let cellC = collectionView.dequeueCVCell(for: indexPath, cell: TopSellingCVCell.self)!
            cellC.config(viewModel.newInArray[indexPath.row])
            return cellC
        }
    }
}
// MARK: - UICollectionViewDelegateFlowLayout
extension HomeVC: UICollectionViewDelegateFlowLayout {

    func drawBrandsSection() -> NSCollectionLayoutSection {
        let spacingBetweenGroup: CGFloat = 14
        let groupWidth: CGFloat =  80 + spacingBetweenGroup
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
        section.boundarySupplementaryItems = viewModel.catagoryArray.isEmpty ?  []:[headerSupplementary]
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
        section.boundarySupplementaryItems = viewModel.topSellingArray.isEmpty ?  []:[headerSupplementary]
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
            let header = collectionView.dequeueSupplementaryView(for: UICollectionView.elementKindSectionHeader, indexPath: indexPath, view: HomeHeaderReusable.self)
            let item = (viewModel.sectionTitle?[indexPath.section])!
            header?.config(item)
            return header ?? UICollectionReusableView()
        }
        return UICollectionReusableView()
    }
}
extension HomeVC: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.options.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.contentView.backgroundColor = ._1_D_182_A
        cell.textLabel?.textColor = .label
        cell.textLabel?.text = viewModel.options[indexPath.row].rawValue
        cell.textLabel?.setCustomFont(font: .GabaritoBold, size: 15)
        cell.textLabel?.textAlignment = .center
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        genderLbl.text =  viewModel.options[indexPath.row].rawValue
        viewModel.setSelectedGender(index: indexPath.row)
        toggleDropdown()
    }


}
extension HomeVC: UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        presentDetail(SearchByNameVC())
    }
}
