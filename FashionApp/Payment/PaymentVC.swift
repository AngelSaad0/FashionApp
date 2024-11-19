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
    var paymentData: [PaymentSection] = paymentDummyData
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        setupTableView()
    }

    func initUI() {
        titleLbl.setCustomFont(font: .CircularStdBold, size: 24)
    }
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerTVNib(cell: PaymentTVCell.self)
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
        paymentData[section].items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueTVCell(index: indexPath) as! PaymentTVCell
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

    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        header.textLabel?.textColor = .label
        header.textLabel?.setCustomFont(font: .GabaritoBold, size: 15)
        header.textLabel?.frame = header.bounds.offsetBy(dx: 20, dy: 0)
    }

}
