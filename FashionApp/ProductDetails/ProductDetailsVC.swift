//
//  ProductDetailsVC.swift
//  FashionApp
//
//  Created by Engy on 11/18/24.
//

import UIKit

class ProductDetailsVC: UIViewController {

    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var productPriceLbls: [UILabel]!
    @IBOutlet var productTitle: UILabel!
    @IBOutlet var allLabelFontGabarito: [UILabel]!
    @IBOutlet var allLabelFontCircular: [UILabel]!
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

    let colorDropdownTableView = UITableView()
    let sizeDropdownTableView = UITableView()
    var isColorDropdownVisible = false
    var isSizeDropdownVisible = false


    //    var detatails: Products?
    var detatails:Products = productsList[0]
    var images: [String] = []


    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupCollectionView()
    }

    func  setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "ProductDetailsCVCell", bundle: nil), forCellWithReuseIdentifier: "ProductDetailsCVCell")

    }
    func setupUI() {
        //        guard let detatails = detatails  else {return}
        images = Array(repeating: detatails.image, count: 4)
        productTitle.text = detatails.title

        allLabelFontGabarito.forEach{$0.setGabaritoFont(size: 16)}
        allLabelFontCircular.forEach{$0.setCircularFont(size: 16)}
        roundedView.forEach{$0.layer.cornerRadius = colorView.frame.height/2}
        cornerRadiusView.forEach{$0.layer.cornerRadius = 8}

        for lbl in productPriceLbls {lbl.text = detatails.price }


    }
    private func setupDropdownTableView(dropdownTableView: UITableView,dropdownBtn: UIButton,isDropdownVisible: Bool) {
        dropdownTableView.delegate = self
        dropdownTableView.dataSource = self
        dropdownTableView.isHidden = isDropdownVisible

        dropdownTableView.layer.borderColor = UIColor.lightGray.cgColor
        dropdownTableView.backgroundColor =  UIColor(named: "#1D182A")
        dropdownTableView.layer.borderWidth = 1
        dropdownTableView.layer.cornerRadius = 8

        view.addSubview(dropdownTableView)

        dropdownTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dropdownTableView.topAnchor.constraint(equalTo: dropdownBtn.bottomAnchor, constant: 5),
            dropdownTableView.trailingAnchor.constraint(equalTo: dropdownBtn.trailingAnchor),
            dropdownTableView.widthAnchor.constraint(equalTo: dropdownBtn.widthAnchor,multiplier: 0.5),
            dropdownTableView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.2)
        ])
    }

    private func toggleDropdown(dropdownTableView: UITableView,arrowImg: UIImageView,isDropdownVisible:Bool) {
        dropdownTableView.isHidden = !isDropdownVisible
        updateDropdownButtonImage(isDropdownVisible: isDropdownVisible, arrowImg: arrowImg)
        updateDropdownButtonImage(isDropdownVisible: isDropdownVisible, arrowImg: arrowImg)
    }

    private func updateDropdownButtonImage(isDropdownVisible: Bool,arrowImg:UIImageView) {
        let arrowImageName = isDropdownVisible ? "arrowup" : "arrowdown"
        arrowImg.image = UIImage(named: arrowImageName)
    }

    @IBAction func sizeBtnClicked(_ sender: Any) {
        isSizeDropdownVisible.toggle()
        setupDropdownTableView(dropdownTableView: sizeDropdownTableView, dropdownBtn: sender as! UIButton, isDropdownVisible: isSizeDropdownVisible)

    }
    @IBAction func colorBtnClicked(_ sender: Any) {
        isColorDropdownVisible.toggle()
        setupDropdownTableView(dropdownTableView: colorDropdownTableView, dropdownBtn: sender as! UIButton, isDropdownVisible: isColorDropdownVisible)
    }

    @IBAction func blusBtnClicked(_ sender: Any) {
        count += 1
    }

    @IBAction func minusBtnClicked(_ sender: Any) {
        count = max(count-1, 0)
    }

}
//let image = arrowImages.first {$0.tag == 0} ?? UIImageView()


extension ProductDetailsVC: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  tableView == sizeDropdownTableView ?  detatails.sizes.count : detatails.colors.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
//        if tableView == sizeDropdownTableView {
//            cell.imageView?.image =
//        }

        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == sizeDropdownTableView {
            sizeLbl.text =  detatails.sizes[indexPath.row]
            toggleDropdown(dropdownTableView: sizeDropdownTableView, arrowImg: UIImageView(), isDropdownVisible: isSizeDropdownVisible)
        }else {
            colorView.backgroundColor = UIColor(colorName: detatails.colors[indexPath.row])
            toggleDropdown(dropdownTableView: colorDropdownTableView, arrowImg: UIImageView(), isDropdownVisible: isColorDropdownVisible)
        }
    }
}



extension ProductDetailsVC :UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductDetailsCVCell", for: indexPath) as! ProductDetailsCVCell
        cell.img.image  = UIImage(named: images[indexPath.row])
        return cell

    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfCellInRow: CGFloat = 2
        let flowlayout = collectionViewLayout as!UICollectionViewFlowLayout

        let collectionViewWidth = collectionView.bounds.width
        let spacingBetweenCell = flowlayout.minimumLineSpacing*(numberOfCellInRow-1)
        let adjustWidth = collectionViewWidth-spacingBetweenCell
        let width = (adjustWidth/numberOfCellInRow)-24
        return CGSize(width: width, height: collectionView.bounds.height - 48)

    }


}
////
////  AboutYourselfVC.swift
////  FashionApp
////
////  Created by Engy on 11/14/24.
////
//
//import UIKit
//
//class AboutYourselfVC: UIViewController{
//
//
//    @IBOutlet var titleLbl: UILabel!
//    @IBOutlet var lbls:[UILabel]!
//    @IBOutlet var btns:[UIButton]!
//
//    @IBOutlet var ageRangLbl: UILabel!
//    @IBOutlet var arrowImg: UIImageView!
//    @IBOutlet var dropdownButton: UIButton!
//    @IBOutlet var roundedView: UIView!
//
//    let dropdownTableView = UITableView()
//    let options = [ "Under 18","18-24", "25-34", "35-44", "45-54", "55+", "65-74", "75+"]
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupUI()
//        setupDropdownTableView()
//    }
//
//
//    func setupUI() {
//        roundedView.layer.cornerRadius = 20
//        lbls.forEach{$0.setCircularFont(size: 16)}
//        btns.forEach{$0.setCircularFont(size: 16)}
//        btns.forEach{$0.layer.cornerRadius = 20}
//        titleLbl.setCircularBoldFont(size: 24)
//    }
//
//
//    @IBAction func finishBtnClicked(_ sender: Any) {
//        UIWindow.setRootViewController(viewController: MainTabBarVC())
//    }
//
//    @IBAction func dropdownButtonCliked(_ sender: UIButton) {
//        toggleDropdown()
//
//    }
//
//    private func toggleDropdown() {
//        isDropdownVisible.toggle()
//        dropdownTableView.isHidden = !isDropdownVisible
//        updateDropdownButtonImage(isDropdownVisible: isDropdownVisible)
//        updateDropdownButtonImage(isDropdownVisible: isDropdownVisible)
//    }
//    private func setupDropdownTableView() {
//        dropdownTableView.delegate = self
//        dropdownTableView.dataSource = self
//
//        dropdownTableView.isHidden = true
//
//        dropdownTableView.layer.borderColor = UIColor.lightGray.cgColor
//        dropdownTableView.layer.borderWidth = 1
//        dropdownTableView.layer.cornerRadius = 8
//
//        view.addSubview(dropdownTableView)
//
//        dropdownTableView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            dropdownTableView.topAnchor.constraint(equalTo: dropdownButton.bottomAnchor, constant: 5),
//            dropdownTableView.centerXAnchor.constraint(equalTo: dropdownButton.centerXAnchor),
//            dropdownTableView.widthAnchor.constraint(equalTo: dropdownButton.widthAnchor),
//            dropdownTableView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.2)
//        ])
//    }
//
//    private func updateDropdownButtonImage(isDropdownVisible: Bool) {
//        let arrowImageName = isDropdownVisible ? "arrowup" : "arrowdown"
//        arrowImg.image = UIImage(named: arrowImageName)
//    }
//
//
//
//}
//
//extension AboutYourselfVC : UITableViewDelegate, UITableViewDataSource  {
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return options.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = UITableViewCell()
//        cell.textLabel?.text = options[indexPath.row]
//        return cell
//    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        ageRangLbl.text =  options[indexPath.row]
//        toggleDropdown()
//    }
//
//}
//
