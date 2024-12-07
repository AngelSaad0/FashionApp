//
//  CheckoutVC.swift
//  FashionApp
//
//  Created by Engy on 11/18/24.
//
import UIKit

class CheckoutVC: UIViewController {
    @IBOutlet var tableView: UITableView!
    @IBOutlet var tileLbl: UILabel!
    @IBOutlet var cornerRaduisView: [UIView]!
    @IBOutlet var checkoutBtn: UIButton!
    @IBOutlet var btnView: UIView!
    @IBOutlet var subtotalLbl: UILabel!
    @IBOutlet var shippingCostLbl: UILabel!
    @IBOutlet var taxLbl: UILabel!
    @IBOutlet var totalLbl: UILabel!
    @IBOutlet var allLbLFonts: [UILabel]!
    var items: [(title: String, subtitle: String)] = []
    var dummyOrderSummary:OrderSummary?
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDummyData()
        setupUI()
        setupTableView()

    }
    func setupUI() {
        btnView.addCornerRadius(20)
        cornerRaduisView.forEach{$0.addCornerRadius(8)}
        tileLbl.setCustomFont(font: .CircularStdBold, size: .extraLarge)
        checkoutBtn.setCustomFont(size: .medium)
        allLbLFonts.forEach{$0.setCustomFont(font: .CircularStdBook,size: .medium)}
        totalLbl.setCustomFont(font: .GabaritoBold, size: .medium)
    }

    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "CheckoutTVCell", bundle: nil), forCellReuseIdentifier: "CheckoutTVCell")
    }



    @IBAction func checkoutBtnClicked(_ sender: Any) {
        presentDetail(OrderSuccessVC())
    }



    @IBAction func BackBtnClicked(_ sender: Any) {
        dismissDetail()
    }



}


extension CheckoutVC {
    func setupDummyData() {
        items = [
            ("Shipping Address", "Add Shipping Address"),
            ("Payment Method", "Add Payment Method")
        ]
        dummyOrderSummary = OrderSummary(
            subtotal: 200.00,
            shippingCost: 8.00,
            tax: 6.00,
            total: 208.00
        )
    }

}
extension CheckoutVC : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CheckoutTVCell", for: indexPath) as! CheckoutTVCell
        let item = items[indexPath.row]
        cell.configure(title: item.title, subtitle: item.subtitle)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        88
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0 : presentDetail(AddressVC())
        default : presentDetail(PaymentVC())
        }
    }

}
