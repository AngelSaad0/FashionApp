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
    @IBOutlet var tableView: UITableView!
    @IBOutlet var searchBar: UISearchBar!

    @IBOutlet var resultLbl: UILabel!
    @IBOutlet var fillerviews: [UIView]!
    var catagoryItems: [CategoryModel] = catagoryDummyData
    var fillerList:[CategoryModel] = []
    var product:[Products] = productsList
    var searchText = ""

    var filltersOrders:[Products] = [] {
        didSet{
            handelEmptyTable()
        }
    }

    lazy var messageView: HandleMessageView = {
        let view = HandleMessageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.confige(HandleMessageModel(message: .order, action: {}))
        return view
    }()

    var selectedCategory: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        setupTableView()
        setupCollection()
        containerView.isHidden = true
    }

    private func setupUI() {
        //        filltersOrders = orders
        handelEmptyTable()
        productCollectionView.delegate = self
        productCollectionView.dataSource = self
        productCollectionView.registerCVNib(cell: OrdersCVCell.self)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerTVNib(cell: OrdersTVCell.self)
    }
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerTVNib(cell: ShopByCategoriesTVCell.self)
    }
    func setupCollection() {
        productCollectionView.delegate = self
        productCollectionView.dataSource = self
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
        let status = statuses[index].stateTitle
        if status == .Processing {
            //            filltersOrders = orders
        } else {
            //            filltersOrders = orders.filter{$0.status == status}
        }

        tableView.reloadData()

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
        header.textLabel?.setCustomFont(font: .GabaritoBold, size: 24)
        header.textLabel?.frame = header.bounds.offsetBy(dx: 24, dy: 0)
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        70
    }
}
// MARK: -  UICollectionViewDelegate , UICollectionViewDataSource
extension SearchByNameVC: UICollectionViewDelegate, UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collectionView {
            productsList.count
        } else {
            fillerList.count
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueCVCell(for: indexPath, cell: TopSellingCVCell.self)!
        cell.config(productsList[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfCellInRow: CGFloat = 2
        let flowlayout = collectionViewLayout as!UICollectionViewFlowLayout
        let collectionViewWidth = collectionView.bounds.width
        let spacingBetweenCell = flowlayout.minimumLineSpacing*(numberOfCellInRow-1)
        let adjustWidth = collectionViewWidth-spacingBetweenCell
        let width = adjustWidth/numberOfCellInRow
        return CGSize(width: width-24, height: width*(281/161))
    }
}

