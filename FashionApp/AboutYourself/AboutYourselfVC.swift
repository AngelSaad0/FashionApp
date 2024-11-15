//
//  AboutYourselfVC.swift
//  FashionApp
//
//  Created by Engy on 11/14/24.
//

import UIKit

class AboutYourselfVC: UIViewController{

    @IBOutlet var ageRangLbl: UILabel!
    @IBOutlet var arrowImg: UIImageView!
    @IBOutlet var dropdownButton: UIButton!
    @IBOutlet var roundedView: UIView!

    let dropdownTableView = UITableView()
    let options = [ "Under 18","18-24", "25-34", "35-44", "45-54", "55+", "65-74", "75+"]
    var isDropdownVisible = false

    override func viewDidLoad() {
        super.viewDidLoad()
        roundedView.layer.cornerRadius = 20
        setupDropdownTableView()
    }


    @IBAction func dropdownButtonCliked(_ sender: UIButton) {
        toggleDropdown()

    }

    private func toggleDropdown() {
        isDropdownVisible.toggle()
        dropdownTableView.isHidden = !isDropdownVisible
        updateDropdownButtonImage(isDropdownVisible: isDropdownVisible)
        updateDropdownButtonImage(isDropdownVisible: isDropdownVisible)
    }
    private func setupDropdownTableView() {
        dropdownTableView.delegate = self
        dropdownTableView.dataSource = self

        dropdownTableView.isHidden = true

        dropdownTableView.layer.borderColor = UIColor.lightGray.cgColor
        dropdownTableView.layer.borderWidth = 1
        dropdownTableView.layer.cornerRadius = 8

        view.addSubview(dropdownTableView)

        dropdownTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dropdownTableView.topAnchor.constraint(equalTo: dropdownButton.bottomAnchor, constant: 5),
            dropdownTableView.centerXAnchor.constraint(equalTo: dropdownButton.centerXAnchor),
            dropdownTableView.widthAnchor.constraint(equalTo: dropdownButton.widthAnchor),
            dropdownTableView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.2)
        ])
    }

    private func updateDropdownButtonImage(isDropdownVisible: Bool) {
        let arrowImageName = isDropdownVisible ? "arrowup" : "arrowdown"
        arrowImg.image = UIImage(named: arrowImageName)
    }



}

extension AboutYourselfVC : UITableViewDelegate, UITableViewDataSource  {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = options[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        ageRangLbl.text =  options[indexPath.row]
        toggleDropdown()
    }

}
