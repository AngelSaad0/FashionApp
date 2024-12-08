//
//  SearchByNameVC.swift
//  FashionApp
//
//  Created by Engy on 11/19/24.
//

import UIKit

class SearchByNameVC: UIViewController {

    @IBOutlet var containerView: UIView!
    @IBOutlet var productCollectionView: UICollectionView!
    @IBOutlet var fillterCollectionView: UICollectionView!
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var resultLbl: UILabel!
    @IBOutlet var fillerviews: [UIView]!

    var selectedCategory: String?
    var searchText:String?
    let tableView = UITableView()
    var catagoryItems = Category.allCases
    let filterOptions = FilterOption.allCases 
    var product:[Products] = productsList
    lazy var messageView: HandleMessageView = {
        let view = HandleMessageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.confige(HandleMessageModel(message: .order, action: {}))
        return view
    }()
    var filltersOrders:[Products] = [] {
        didSet{
            handelEmptyTable()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchBar()
        setupTableView()
        setupCollection()
    }

    private func setupSearchBar() {
        searchText = ""
        searchBar.delegate = self
    }

    private func setupTableView() {
        containerView.isHidden = true
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = ._1_D_182_A
        tableView.separatorStyle = .none
        tableView.registerTVNib(cell: ShopByCategoriesTVCell.self)
        view.addSubview(tableView)
        setupTableViewConstains()
    }
    private func setupTableViewConstains() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor,constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: 20),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    func setupCollection() {
        let cvs = [fillterCollectionView,productCollectionView]
        cvs.forEach{
            $0?.delegate = self
            $0?.dataSource = self
        }
        fillterCollectionView.registerCVNib(cell: FillerCollectionCVCell.self)
        productCollectionView.registerCVNib(cell: TopSellingCVCell.self)
    }

    private func setupMessageViewConstraint() {
        NSLayoutConstraint.activate([
            messageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            messageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            messageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            messageView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }

    func handelEmptyTable () {
        if filltersOrders.isEmpty {
            if !view.subviews.contains(messageView) {
                view.addSubview(messageView)
                setupMessageViewConstraint()
            }
            tableView.isHidden = true
        } else {
            messageView.removeFromSuperview()
            tableView.isHidden = false
        }
    }

    func fillterReuslts(index:Int) {
    }

    @IBAction func backBtnCliked(_ sender: Any) {
        dismissDetail()
    }

}
extension SearchByNameVC: UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        resetSearchResults(reset: false)
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        guard let searchText = searchBar.text, !searchText.isEmpty else {
            resetSearchResults(reset: true)
            return
        }
        performSearch(for: searchText)
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            resetSearchResults(reset: true)
        } else {
            resetSearchResults(reset: false)
            filterResults(for: searchText)
        }
    }

    private func performSearch(for query: String) {
        print("Performing search for: \(query)")
    }

    private func filterResults(for query: String) {
        print("Filtering results for: \(query)")
    }

    private func resetSearchResults(reset:Bool) {
        print("Resetting search results")
        tableView.isHidden = !reset
        containerView.isHidden = reset
    }
}


// MARK: -  UITableViewDelegate , UITableViewDataSource
extension SearchByNameVC: UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        catagoryItems.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueTVCell(index: indexPath, cell: ShopByCategoriesTVCell.self)
        cell.config(catagoryItems[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        72
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presentDetail(ShopByCategoriesNameVC())
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Shop by Categories"
    }

    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        header.textLabel?.textColor = .label
        header.textLabel?.setCustomFont(font: .GabaritoBold, size: .size14)
        header.textLabel?.frame = header.bounds.offsetBy(dx: 24, dy: 0)
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        70
    }
}
// MARK: -  UICollectionViewDelegate
extension SearchByNameVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        view.endEditing(true)
        switch indexPath.row {
        case 0: create(filterOption:.allFillter)
        case 1: create(filterOption:.sortBy)
        case 2: create(filterOption:.gender)
        case 3: create(filterOption:.deals)
        case 4: create(filterOption:.price)
        default:break
        }
    }
    private func create(filterOption:FilterOption) {
        let vc = ProductDropDownVC()
        vc.vcTitle = filterOption.title
        vc.antherOptions = filterOption.options
        if let presentationController = vc.presentationController as? UISheetPresentationController {
//            presentationController.detents = [size16()]
        }
        present(vc, animated: true)

    }
}

// MARK: -  UICollectionViewDataSource
extension SearchByNameVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == productCollectionView {
            return productsList.count
        } else if collectionView ==  fillterCollectionView {
            return filterOptions.count
        }
        return 0
    }
}

// MARK: -  UICollectionViewDelegateFlowLayout
extension SearchByNameVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == productCollectionView {
            let cell = collectionView.dequeueCVCell(for: indexPath, cell: TopSellingCVCell.self)!
            cell.config(productsList[indexPath.row])
            return cell
        } else if collectionView ==  fillterCollectionView {
            let cell = collectionView.dequeueCVCell(for: indexPath, cell: FillerCollectionCVCell.self)!
            cell.config(filterOptions[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == productCollectionView {
            return productCollectionViewLayout(collectionView: productCollectionView, (collectionViewLayout as? UICollectionViewFlowLayout)!)
        }
        else {
            return fillterCollectionViewLayout(indexPath: indexPath)
        }
    }
    private func productCollectionViewLayout(collectionView:UICollectionView,_ collectionViewLayout:UICollectionViewFlowLayout) -> CGSize {
        let numberOfCellInRow: CGFloat = 2
        let flowlayout = collectionViewLayout
        let collectionViewWidth = collectionView.bounds.width
        let spacingBetweenCell = flowlayout.minimumLineSpacing*(numberOfCellInRow-1)
        let adjustWidth = collectionViewWidth-spacingBetweenCell
        let width = adjustWidth/numberOfCellInRow
        return CGSize(width: width-24, height: width*(281/161))
    }
    private func fillterCollectionViewLayout(indexPath:IndexPath) -> CGSize {
        let defaultWidth: CGFloat = 78
        let height: CGFloat = 30
        let customWidth: CGFloat = indexPath.row == 0 ? 43 : defaultWidth
        return CGSize(width: customWidth, height: height)
    }
}
