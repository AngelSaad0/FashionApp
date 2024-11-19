//
//  CartVC.swift
//  FashionApp
//
//  Created by Engy on 11/18/24.
//

import UIKit

class CartVC: UIViewController {

    @IBOutlet var mainView: UIView!
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
    var cartArray:[Products] = [] {
        didSet{
            handelEmptyTable()
        }
    }
    var dummyOrderSummary:OrderSummary?

    lazy var messageView: HandleMessageView = {
        let  messageHeight: CGFloat = 300
        let centerMainView = UIScreen.main.bounds.height/2 - messageHeight/2
        let view = HandleMessageView(frame: CGRect(x: 0, y: centerMainView, width: UIScreen.main.bounds.width, height: messageHeight))
        view.confige(HandleMessageModel(message: .emptyCart, action: {}))

        return view
    }()


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
        var shippingCost = 8.00
        if cartArray.isEmpty{
            shippingCost = 0.0
        }
        let total = subtotal + tax + shippingCost

        dummyOrderSummary = OrderSummary(subtotal: subtotal, shippingCost: shippingCost, tax: tax, total: total)
        updatOrderSummary()
    }

    func setupUI() {
        couponBtn.layer.cornerRadius = couponBtn.frame.height/2
        checkoutBtn.layer.cornerRadius = 20
        cornerRaduisView.forEach{$0.layer.cornerRadius = 8}
        tileLbl.setCustomFont(font: .CircularStdBold, size: 24)
        checkoutBtn.setCustomFont(font: .CircularStdBook, size: 16)
        removeAllBtn.setCustomFont(font: .CircularStdBook,size: 16)
        allLbLFonts.forEach{$0.setCustomFont(font: .CircularStdBook,size: 16)}
        totalLbl.setCustomFont(font: .GabaritoBold, size: 16)
        couponTxtField.setCustomFont(font: .CircularStdBook,size: 12)

    }
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "CartTVCell", bundle: nil), forCellReuseIdentifier: "CartTVCell")
        recalculateOrderSummary()
    }


    @IBAction func removeAllBtnClicked(_ sender: Any) {
        cartArray.removeAll()
        tableView.reloadData()
        recalculateOrderSummary()
    }

    @IBAction func BackBtnClicked(_ sender: Any) {
        dismissDetail()
    }

    @IBAction func checkoutBtnClicked(_ sender: Any) {
        presentDetail(CheckoutVC())
    }

    func handelEmptyTable () {
        if cartArray.isEmpty {
            if !view.subviews.contains(messageView) {
                view.addSubview(messageView)
            }
            mainView.isHidden = true
        } else {
            messageView.removeFromSuperview()
            mainView.isHidden = false
        }
    }
}


extension CartVC {
    func setupDummyData() {
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
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        cartArray.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
        tableView.reloadData()
    }


}
