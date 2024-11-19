//
//  ProductDropDownVC.swift
//  FashionApp
//
//  Created by Engy on 11/19/24.
//

import UIKit

class ProductDropDownVC: UIViewController {

    @IBOutlet var containerView: UIView!
    @IBOutlet var titleLbl: UILabel!
    @IBOutlet var tableView: UITableView!
    var sizeArray:[String]?
    var colorArray:[String]?
    var vcTitle:String?
    var userSelection: (Int) ->() = {_ in }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        containerView.addCornerRadius(20)
        titleLbl.setCustomFont(font: .CircularStdBold, size: 24)
        titleLbl.text = vcTitle
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerTVNib(cell: ProductDropDownTVCell.self)
    }

    @IBAction func closeBtnClicked(_ sender: Any) {
        dismiss(animated:true)
    }
}

extension ProductDropDownVC: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colorArray?.count ?? sizeArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueTVCell(index: indexPath,cell: ProductDropDownTVCell.self)
        if colorArray != nil {
            cell.configCellForColor(colorArray![indexPath.row])
        } else  if sizeArray != nil{
            cell.configCellForSize(sizeArray![indexPath.row])
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        72
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        userSelection(indexPath.row)
    }



}
