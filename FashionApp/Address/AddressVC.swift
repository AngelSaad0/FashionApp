//
//  AddressVC.swift
//  FashionApp
//
//  Created by Engy on 11/17/24.
//

import UIKit

class AddressVC: UIViewController {

    @IBOutlet var titleLbl: UILabel!
    @IBOutlet var tableview: UITableView!
    var dummyAddresses: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupDummyData()
        setupTableView()
    }

    func setupUI() {
        titleLbl.setCircularBoldFont(size: 24)
    }

    func setupTableView() {
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(UINib(nibName: "AddressTVCell", bundle: nil), forCellReuseIdentifier: "AddressTVCell")

    }

    func setupDummyData() {
         dummyAddresses = [
            "2715 Ash Dr. San Jose, South Dakota 83475",
            "123 Elm St. Springfield, Illinois 62704",
            "456 Oak St. Denver, Colorado 80220",
            "789 Maple Ave. Austin, Texas 78701",
            "101 Pine Rd. Boston, Massachusetts 02110",
            "202 Birch Blvd. Seattle, Washington 98109",
            "303 Cedar Ln. Miami, Florida 33101",
            "404 Walnut Way. Phoenix, Arizona 85001",
            "505 Cherry Ct. Dallas, Texas 75201",
            "606 Willow Dr. Chicago, Illinois 60605",
            "707 Poplar Pl. Atlanta, Georgia 30301",
            "808 Spruce Ln. Nashville, Tennessee 37201",
            "909 Aspen Rd. New York, New York 10001",
            "1001 Fir Dr. Los Angeles, California 90001",
            "1112 Redwood St. San Francisco, California 94101",
            "1213 Magnolia Blvd. Portland, Oregon 97201",
            "1314 Sycamore Ln. Houston, Texas 77001",
            "1415 Hickory St. Orlando, Florida 32801",
            "1516 Alder Rd. Las Vegas, Nevada 89101",
            "1617 Juniper Ave. Salt Lake City, Utah 84101"
        ]


    }

    @IBAction func backBtnClicked(_ sender: Any) {
        dismissDetail()
    }


}
extension AddressVC: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dummyAddresses.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddressTVCell") as! AddressTVCell
        cell.config(dummyAddresses[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        84
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presentDetail(AddAddressVC())
    }

}
