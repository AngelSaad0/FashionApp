//
//  PaymentVC.swift
//  FashionApp
//
//  Created by Engy on 11/17/24.
//



import UIKit

class PaymentVC: UIViewController {
    @IBOutlet var tableView: UITableView!

    @IBOutlet var titleLbl: UILabel!
    var paymentData: [PaymentSection] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupDummyData()
        initUI()
        setupTableView()
    }


    func setupDummyData() {
        paymentData = [
            PaymentSection(
                title: "Cards",
                items: ["**** 4187", "**** 9387"],
                icons: ["payment", "payment"]
            ),
            PaymentSection(
                title: "Paypal",
                items: ["Cloth@gmail.com"],
                icons: ["paypal_default"]
            )
        ]
    }
    func initUI() {
        titleLbl.setCircularFont(size: 24)

    }
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "PaymentTVCell", bundle: nil), forCellReuseIdentifier: "PaymentTVCell")
    }

    @IBAction func backBtnClicked(_ sender: Any) {
        dismissDetail()
    }
    
}

extension PaymentVC: UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        paymentData.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return paymentData[section].items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PaymentTVCell", for: indexPath) as! PaymentTVCell
        let section = paymentData[indexPath.section]
        let item = section.items[indexPath.row]
        let iconName = section.icons.isEmpty ? nil:section.icons[indexPath.row]
        cell.configure(item: item, iconName: iconName)
        return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return paymentData[section].title
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 84
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        20
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = paymentData[section].title
        titleLabel.setGabaritoFont(size: 15)
        titleLabel.textColor = .label
        titleLabel.textAlignment = .left
        headerView.addSubview(titleLabel)

        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 24),
            titleLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: 0),
            titleLabel.topAnchor.constraint(equalTo: headerView.topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: headerView.bottomAnchor)
        ])
        return headerView
    }


}
