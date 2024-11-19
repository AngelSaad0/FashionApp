//
//  OrderDetailsVC.swift
//  FashionApp
//
//  Created by Engy on 11/17/24.
//

import UIKit

class OrderDetailsVC: UIViewController {
    @IBOutlet var cornerRadiusViews: [UIView]!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var titleLbl: UILabel!
    @IBOutlet var orderCountLbl: UILabel!
    @IBOutlet var phoneLbl: UILabel!
    @IBOutlet var addressLbl: UILabel!
    @IBOutlet var viewAllBtn: UIButton!
    @IBOutlet var shippngDetailsLbl: UILabel!
    @IBOutlet var orderItemLbl: UILabel!
    var orderDetails:OrdersModel?
    var status: [Status]?
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupDummyData()
        setupTableView()

    }
    func setupTableView () {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerTVNib(cell: OrderDetailsTVCell.self)
    }

    func setupUI() {
        cornerRadiusViews.forEach{$0.addCornerRadius(8)}
        titleLbl.setCustomFont(font: .GabaritoBold, size: 16)
        shippngDetailsLbl.setCustomFont(font: .GabaritoBold, size: 16)
        orderItemLbl.setCustomFont(font: .GabaritoBold, size: 16)
        viewAllBtn.setCustomFont(font: .GabaritoBold, size: 12)
        viewAllBtn.setCustomFont(font: .CircularStdBook, size: 16)
        phoneLbl.setCustomFont(font: .CircularStdBook, size: 12)
        addressLbl.setCustomFont(font: .CircularStdBook, size: 12)
    }

    func setupDummyData() {
        status = [ .Delivered,.Shipped,.Confirmed,.Placed]
        guard let orderDetails = orderDetails else {return}
        titleLbl.text = "Order  #\(orderDetails.id)"
        orderCountLbl.text = "\(orderDetails.orderCount) items"
        phoneLbl.text = orderDetails.phoneNumber
        addressLbl.text = orderDetails.address
    }

    @IBAction func viewAllBtnClicked(_ sender: UIButton) {
        dismissDetail()
    }
}
extension OrderDetailsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueTVCell(index: indexPath,cell: OrderDetailsTVCell.self)
        let index = indexPath.row
        cell.comfig(orderDetails!,statue: status![index])
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
}
