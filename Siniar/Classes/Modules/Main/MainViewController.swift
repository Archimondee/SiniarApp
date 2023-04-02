//
//  MainViewController.swift
//  Siniar
//
//  Created by Gilang Aditya Rahman on 01/04/23.
//

import UIKit

class MainViewController: UITabBarController {
  override func viewDidLoad() {
    super.viewDidLoad()
    setup()
  }

  func setup() {
    tabBar.tintColor = UIColor.Siniar.brand1
    tabBar.unselectedItemTintColor = UIColor.Siniar.neutral2
    let home = UINavigationController(rootViewController: HomeViewController())
    home.tabBarItem.image = UIImage(named: "tab_home")
    home.tabBarItem.selectedImage = UIImage(named: "tab_home")
    home.title = "Home"

    let search = UINavigationController(rootViewController: SearchViewController())
    search.tabBarItem.image = UIImage(named: "tab_search")
    search.tabBarItem.selectedImage = UIImage(named: "tab_search")
    search.title = "Search"

    let account = UINavigationController(rootViewController: AccountViewController())
    account.tabBarItem.image = UIImage(named: "tab_account")
    account.tabBarItem.selectedImage = UIImage(named: "tab_account")
    account.title = "Account"

    viewControllers = [home, search, account]
  }
}

// MARK: - UIViewController

extension UIViewController {
  // Set to root window
  func showMainViewController() {
    let viewController = MainViewController()
    let window = UIApplication.shared.windows.first { $0.isKeyWindow }
    window?.rootViewController = viewController
  }
}
