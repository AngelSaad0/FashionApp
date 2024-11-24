//
//  ProductDetailsVC.swift
//  FashionApp
//
//  Created by Engy on 11/18/24.
//

import UIKit

class : UIViewController {
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var productPriceLabel: UILabel!
    @IBOutlet var productTitle: UILabel!
    @IBOutlet var descriptionLbl: UILabel!
    @IBOutlet var allLabelFontGabarito: [UILabel]!
    @IBOutlet var allLabelFontCircular: [UILabel]!
    @IBOutlet var allLabelCircularSize12: [UILabel]!
    @IBOutlet var arrowImages: [UIImageView]!
    @IBOutlet var sizeLbl: UILabel!
    @IBOutlet var colorView: UIView!
    @IBOutlet var roundedView: [UIView]!
    @IBOutlet var cornerRadiusView: [UIView]!
    @IBOutlet var blusClicked: UIButton!
    @IBOutlet var minusBtn: UIButton!
    @IBOutlet var quantityLbl: UILabel!
    let viewModel = ProductDetailsViewModel()
    var count = 1 {
        didSet {
            quantityLbl.text = "\(count)"
        }
    }
    var images: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupViewModel()
        setupCollectionView()
        updateData()
    }

    func setupViewModel() {
        viewModel.dataBinding = {
            self.collectionView.reloadData()
            self.updateData()
        }
        viewModel.fetchDataFromNetwork()
    }

    func  setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        tableView.delegate = self
        tableView.dataSource = self
        collectionView.registerCVNib(cell: ProductDetailsCVCell.self)
        tableView.registerTVNib(cell: ProductReviewCell.self)
    }

    func setupUI() {
        sizeLbl.setCustomFont(font: .GabaritoBold, size: 15)
        allLabelFontGabarito.forEach{$0.setCustomFont(font: .GabaritoBold, size: 16)}
        allLabelFontCircular.forEach{$0.setCustomFont(font: .CircularStdBook, size: 16)}
        allLabelCircularSize12.forEach{$0.setCustomFont(font: .CircularStdBold, size: 16)}
        roundedView.forEach{$0.layer.cornerRadius = $0.frame.height/2}
        cornerRadiusView.forEach{$0.layer.cornerRadius = 16}

    }

    func updateData() {
        guard let detatails = viewModel.product  else {return}
        productTitle.text = detatails.title
        descriptionLbl.text = detatails.bodyHTML
        quantityLbl.text =  "\(detatails.variants[0].inventoryQuantity)"
        productPriceLabel.text = "\(detatails.variants[0].price) $"
    }


    @IBAction func sizeBtnClicked(_ sender: Any) {
        guard let detatails = viewModel.product  else {return}
        let vc = ProductDropDownVC()
        vc.vcTitle = "Size"
        vc.antherOptions = detatails.options.filter{$0.name == .size}
        if let presentationController = vc.presentationController as? UISheetPresentationController {
            presentationController.detents = [.medium()]
        }
        vc.userSelection = { index in
            self.sizeLbl.text = vc.antherOptions?[index].name.rawValue
        }
        present(vc, animated: true)
    }

    @IBAction func colorBtnClicked(_ sender: Any) {
        guard let detatails = viewModel.product  else {return}
        let vc = ProductDropDownVC()
        vc.vcTitle = "Color"
        vc.colorArray = detatails.options.filter{$0.name == .color}
        if let presentationController = vc.presentationController as? UISheetPresentationController {
            presentationController.detents = [.medium()]
        }
        vc.userSelection = { index in
            self.colorView.backgroundColor = UIColor(colorName: vc.colorArray?[index].name.rawValue ?? "")
        }
        present(vc, animated: true)
    }

    @IBAction func blusBtnClicked(_ sender: Any) {
        count += 1
    }

    @IBAction func minusBtnClicked(_ sender: Any) {
        count = max(1, count-1)
    }

    @IBAction func backBtnCliked(_ sender: Any) {
        dismissDetail()
    }

    @IBAction func addToBagBtnClicked(_ sender: Any) {
    }
    
}

extension ProductDetailsVC :UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.product?.images.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = collectionView.dequeueCVCell(for: indexPath,cell: ProductDetailsCVCell.self)
        cell?.config(viewModel.product?.images[indexPath.row].src ?? "")
        return cell ?? UICollectionViewCell()
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfCellInRow: CGFloat = 2
        let flowlayout = collectionViewLayout as!UICollectionViewFlowLayout

        let collectionViewWidth = collectionView.bounds.width
        let spacingBetweenCell = flowlayout.minimumLineSpacing*(numberOfCellInRow-1)
        let adjustWidth = collectionViewWidth-spacingBetweenCell
        let width = (adjustWidth/numberOfCellInRow)-35
        return CGSize(width: width, height: collectionView.bounds.height - 48)
    }
}
extension ProductDetailsVC: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return /*TopSellingModel?.reviews.count ??*/ 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueTVCell(index: indexPath,cell: ProductReviewCell.self)
//        cell.config(detatails!.reviews[indexPath.row])
        return cell
    }

}

