//
//  MainTabBarVC.swift
//  FashionApp
//
//  Created by Engy on 11/15/24.
//


import UIKit

class MainTabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTabBarAppearance()
    }
    // MARK: -  setup UI for Main TabBar
    private func setupUI() {
        let homeVC = createViewController(for: HomeVC.self, image: "home")
        let notificationVC = createViewController(for: NotificationsVC.self, image:"note")
        let orderVC = createViewController(for: OrdersVC.self, image: "order")
        let accountVC = createViewController(for: AccountVC.self, image:"account")
        viewControllers = [homeVC, notificationVC, orderVC, accountVC]
    }

    // MARK: -  create ViewController
    private func createViewController(for viewControllerID: UIViewController.Type, image: String) -> UIViewController {
        let vc = viewControllerID.init()
        vc.tabBarItem.image = UIImage(named: image)
        return vc
    }
    // MARK: -  setup TabBar Appearance
    private func setupTabBarAppearance() {
        tabBar.tintColor = UIColor(named: "#8E6CEF")
        tabBar.backgroundColor = UIColor(named: "#1D182A")
    }
}

