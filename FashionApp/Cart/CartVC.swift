//
//  CartVC.swift
//  FashionApp
//
//  Created by Engy on 11/18/24.
//

import UIKit

class CartVC: UIViewController {
    @IBOutlet var tableView: UITableView!

    @IBOutlet var tileLbl: UILabel!
    @IBOutlet var cornerRaduisView: [UIView]!
    @IBOutlet var removeAllBtn: UIButton!
    @IBOutlet var checkoutBtn: UIButton!
    @IBOutlet var couponTxtField: UITextField!

    @IBOutlet var couponBtn: UIButton!
    @IBOutlet var subtotalLbl: UILabel!
    @IBOutlet var shippingCostLbl: UILabel!
    @IBOutlet var taxLbl: UILabel!
    @IBOutlet var totalLbl: UILabel!
    @IBOutlet var allLbLFonts: [UILabel]!
    var cartArray:[TopSellingModel] = []
    var dummyOrderSummary:OrderSummary?


    override func viewDidLoad() {
        super.viewDidLoad()
        setupDummyData()
        setupUI()
        updatOrderSummary()
        setupTableView()

    }

    func updatOrderSummary () {
        if let summary = dummyOrderSummary {
            subtotalLbl.text = String(format: "$%.2f", summary.subtotal)
            shippingCostLbl.text = String(format: "$%.2f", summary.shippingCost)
            taxLbl.text = String(format: "$%.2f", summary.tax)
            totalLbl.text = String(format: "$%.2f", summary.total)
        }
    }

    private func recalculateOrderSummary() {
        var subtotal = 0.0
        for item in cartArray {
            if let price = Double(item.price.replacingOccurrences(of: "$", with: "")) {
                subtotal += price * Double(item.quantity)
            }
        }

        let tax = subtotal * 0.03
        let shippingCost = 8.00
        let total = subtotal + tax + shippingCost

        dummyOrderSummary = OrderSummary(subtotal: subtotal, shippingCost: shippingCost, tax: tax, total: total)
        updatOrderSummary()
    }

    func setupUI() {
        couponBtn.layer.cornerRadius = couponBtn.frame.height/2
        checkoutBtn.layer.cornerRadius = 20
        cornerRaduisView.forEach{$0.layer.cornerRadius = 8}
        checkoutBtn.setCircularFont(size: 16)
        couponTxtField.setCircularFont(size: 12)
        removeAllBtn.setCircularFont(size: 16)
        allLbLFonts.forEach{$0.setCircularFont(size: 16)}
        totalLbl.setGabaritoFont(size: 16)
        tileLbl.setCircularFont(size: 24)

    }
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "CartTVCell", bundle: nil), forCellReuseIdentifier: "CartTVCell")
    }


    @IBAction func removeAllBtnClicked(_ sender: Any) {
    }


    @IBAction func checkoutBtnClicked(_ sender: Any) {
    }






}


extension CartVC {
    func setupDummyData() {
        cartArray = [
            TopSellingModel(title: "Men's Harrington Jacket", price: "$148.00", image: "topsell1", color: "Lemon", size: "M"),
            TopSellingModel(title: "Men's Casual T-Shirt", price: "$14.00", image: "topsell2", color: "White", size: "L"),
            TopSellingModel(title: "Unisex Hoodie", price: "$18.00", image: "topsell3", color: "Black", size: "XL"),
            TopSellingModel(title: "Leather Wallet", price: "$349.00", image: "topsell4", color: "Brown", size: "One Size"),
            TopSellingModel(title: "Classic Cap", price: "$50.00", image: "topsell5", color: "Navy Blue", size: "Adjustable"),
            TopSellingModel(title: "Men's Harrington Jacket", price: "$148.00", image: "topsell6", color: "Lemon", size: "M"),
            TopSellingModel(title: "Men's Casual T-Shirt", price: "$14.00", image: "topsell7", color: "Grey", size: "M"),
            TopSellingModel(title: "Unisex Hoodie", price: "$18.00", image: "topsell8", color: "Red", size: "L"),
            TopSellingModel(title: "Leather Wallet", price: "$349.00", image: "topsell9", color: "Black", size: "One Size")
        ]
        dummyOrderSummary = OrderSummary(
            subtotal: 200.00,
            shippingCost: 8.00,
            tax: 6.00,
            total: 208.00
        )
    }

}
extension CartVC : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cartArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartTVCell", for: indexPath) as! CartTVCell
        cell.config(cartArray[indexPath.row])

        cell.onItemCountChange = { [weak self] item, count in
            guard let self = self else { return }
            if let index = self.cartArray.firstIndex(where: { $0.title == item.title }) {
                self.cartArray[index].quantity = count
            }
            self.recalculateOrderSummary()
        }

        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        88
    }


}
