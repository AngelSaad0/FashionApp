//
//  AboutYourselfVC.swift
//  FashionApp
//
//  Created by Engy on 11/14/24.
//

import UIKit

class AboutYourselfViewController: UIViewController{
    // MARK: - Outlets
    @IBOutlet var aboutMeTitleLbl: UILabel!
    @IBOutlet var shopLabel: UILabel!
    @IBOutlet var howOldLabel: UILabel!
    @IBOutlet var ageRangLabel: UILabel!
    @IBOutlet var dropdownButton: UIButton!
    @IBOutlet var finshButton: UIButton!
    @IBOutlet var menButton: UIButton!
    @IBOutlet var womenButton: UIButton!
    @IBOutlet var arrowImg: UIImageView!
    @IBOutlet var roundedContainerView: [UIView]!
    // MARK: - Properties
    let dropdownTableView = UITableView()
    let localizedAgeOptions = AgeRange.localizedOptions
    var isDropdownVisible = false
    var selectedAge = AgeRange.unSpicfied
    var selectedGender: Gender = .man {
        didSet{
            updateButtonStates()
        }
    }
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupDropdownTableView()
        addTapGestureToDismissDropdown()
    }
    // MARK: - Actions Methods
    @IBAction func finishBtnClicked(_ sender: Any) {
        saveUserData()
        UIWindow.setRootViewController(viewController: MainTabBarVC())
    }

    @IBAction func dropdownButtonCliked(_ sender: UIButton) {
        toggleDropdown()
    }

    @IBAction func menButtonCliked(_ sender: UIButton) {
        selectedGender = .man
    }

    @IBAction func womenButtonCliked(_ sender: UIButton) {
        selectedGender = .woman
    }

}
extension AboutYourselfViewController {
    // MARK: - Setup Methods
    private func setupUI() {
        setupLabels()
        setupButtons()
        setupContainerView()
        updateButtonStates()
    }
    private func setupLabels() {
        aboutMeTitleLbl.customLabel(text: .tellUsAboutYourself)
        shopLabel.customLabel(text: .whoDoYouShopFor)
        ageRangLabel.customLabel(text: .ageRange)
        howOldLabel.customLabel(text: .howOldAreYou)
    }
    private func setupButtons() {
        let btns = [finshButton,menButton,womenButton]
        btns.forEach{$0?.addCornerRadius(20)}
        finshButton.customButton(title: .finish)
        menButton.customButton(title: .male)
        womenButton.customButton(titleColor: .C272727, title: .female)

    }
    private func setupContainerView() {
        roundedContainerView.forEach{$0.addCornerRadius(20)}
    }
}
// MARK: - Helper Method
extension AboutYourselfViewController {

    private func updateButtonStates() {
        let isMen = selectedGender == .man
        let isWoman = selectedGender == .woman
        menButton.backgroundColor = UIColor(named: isMen ? Colors.C8E6CEF.rawValue : Colors.CF4F4F4.rawValue)
        menButton.setTitleColor(isMen ? .white:.label, for: .normal)
        womenButton.backgroundColor = UIColor(named: isWoman ? Colors.C8E6CEF.rawValue : Colors.CF4F4F4.rawValue)
        womenButton.setTitleColor(isWoman ? .white:.label, for: .normal)
    }
    private func saveUserData() {
        UserDefaultsManager.shared.gender = selectedGender.rawValue
        UserDefaultsManager.shared.age = selectedAge.rawValue
        UserDefaultsManager.shared.isLogin = true
        UserDefaultsManager.shared.storeData()
    }

    private func addTapGestureToDismissDropdown() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissDropdown))
        tapGesture.delegate = self
        view.addGestureRecognizer(tapGesture)
    }
    @objc private func dismissDropdown() {
        if isDropdownVisible {
            toggleDropdown()
        }
    }
}
// MARK: - UITableViewDelegate, UITableViewDataSource
extension AboutYourselfViewController: UITableViewDelegate, UITableViewDataSource  {
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
        dropdownTableView.backgroundColor = .backButton
        dropdownTableView.layer.borderWidth = 1
        dropdownTableView.layer.cornerRadius = 8
        view.addSubview(dropdownTableView)
        dropdownTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dropdownTableView.topAnchor.constraint(equalTo: dropdownButton.bottomAnchor, constant: 5),
            dropdownTableView.centerXAnchor.constraint(equalTo: dropdownButton.centerXAnchor),
            dropdownTableView.widthAnchor.constraint(equalTo: dropdownButton.widthAnchor),
            dropdownTableView.bottomAnchor.constraint(equalTo: finshButton.topAnchor, constant: -20)
        ])
    }

    private func updateDropdownButtonImage(isDropdownVisible: Bool) {
        let arrowImageName = isDropdownVisible ? "arrowup" : "arrowdown"
        arrowImg.image = UIImage(named: arrowImageName)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return localizedAgeOptions.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.contentView.backgroundColor = .backButton
        cell.textLabel?.text = localizedAgeOptions[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        ageRangLabel.text =  localizedAgeOptions[indexPath.row]
        toggleDropdown()
    }
}
// MARK: - UIGestureRecognizerDelegate
extension AboutYourselfViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        return !dropdownTableView.frame.contains(touch.location(in: view))
    }

}
