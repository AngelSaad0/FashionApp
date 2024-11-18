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
    @IBOutlet var shippngDetails: UILabel!
    @IBOutlet var orderItem: UILabel!
    
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
        tableView.register(UINib(nibName: "OrderDetailsTVCell", bundle: nil), forCellReuseIdentifier: "OrderDetailsTVCell")
    }

    func setupUI() {

        cornerRadiusViews.forEach{$0.layer.cornerRadius = 8}

        titleLbl.setGabaritoFont(size: 16)
        orderCountLbl.setCircularFont(size: 16)
        phoneLbl.setCircularFont(size: 12)
        addressLbl.setCircularFont(size: 12)


        shippngDetails.setGabaritoFont(size: 16)
        orderItem.setGabaritoFont(size: 16)
        viewAllBtn.setGabaritoFont(size: 12)


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
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderDetailsTVCell") as! OrderDetailsTVCell
        let index = indexPath.row
        cell.comfig(orderDetails!,statue: status![index])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
}
