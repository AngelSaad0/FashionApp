//
//  ProductDetailsVC.swift
//  FashionApp
//
//  Created by Engy on 11/18/24.
//

import UIKit

class ProductDetailsVC: UIViewController {
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var productPriceLbls: [UILabel]!
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
    var count = 1 {
        didSet {
            quantityLbl.text = "\(count)"
        }
    }
    var detatails: Products?
    var images: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupCollectionView()
        updateData()
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
    }

    func updateData() {
        guard let detatails = detatails  else {return}
        images = Array(repeating: detatails.image, count: 4)
        productTitle.text = detatails.title
        descriptionLbl.text = detatails.description
        quantityLbl.text =  "\(detatails.quantity)"
        cornerRadiusView.forEach{$0.layer.cornerRadius = 16}
        for lbl in productPriceLbls {lbl.text = "$ \(detatails.price)" }
    }



    @IBAction func sizeBtnClicked(_ sender: Any) {
        guard let detatails = detatails  else {return}
        let vc = ProductDropDownVC()
        vc.vcTitle = "Size"
        vc.sizeArray = detatails.sizes
        if let presentationController = vc.presentationController as? UISheetPresentationController {
            presentationController.detents = [.medium()]
        }
        vc.userSelection = { index in
            self.sizeLbl.text = self.detatails?.sizes[index]
        }
        present(vc, animated: true)
    }

    @IBAction func colorBtnClicked(_ sender: Any) {
        guard let detatails = detatails  else {return}
        let vc = ProductDropDownVC()
        vc.vcTitle = "Color"
        vc.colorArray = detatails.colors
        if let presentationController = vc.presentationController as? UISheetPresentationController {
            presentationController.detents = [.medium()]
        }
        vc.userSelection = { index in
            self.colorView.backgroundColor = UIColor(colorName: self.detatails!.colors[index])
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
    
}

extension ProductDetailsVC :UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = collectionView.dequeueCVCell(for: indexPath) as ProductDetailsCVCell
        cell.img.image  = UIImage(named: images[indexPath.row])
        return cell
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
        return detatails?.reviews.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueTVCell(index: indexPath) as! ProductReviewCell
        cell.config(detatails!.reviews[indexPath.row])
        return cell
    }

}

