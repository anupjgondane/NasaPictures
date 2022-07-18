//
//  TabBarViewController.swift
//  NasaPictures
//
//  Created by Anup Gondane on 16/07/22.
//

import UIKit

enum TabBarType: Int {
    case home
    case favourite
}

/** Tab bar contoller to show different tabs */
class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupViewControllers()
    }
    
    func setupViewControllers() {
        self.viewControllers = [
            getHomeViewController(),
            getFavouriteViewController()
        ]
    }
    
    // Home screen
    func getHomeViewController() -> UINavigationController {
        let homeVC = HomeViewController.getController(storyboard: self.storyboard!) as! HomeViewController
        let homeTabBarItem = UITabBarItem(title: AppConstant.homeTabBarTitle, image: UIImage(systemName: ImageConstant.house), selectedImage: nil)
        homeTabBarItem.tag = TabBarType.home.rawValue
        homeVC.tabBarItem = homeTabBarItem
        return UINavigationController(rootViewController: homeVC)
    }
    
    // Favourite screen
    func getFavouriteViewController() -> UINavigationController {
        let favouriteVC = FavouritesViewController.getController(storyboard: self.storyboard!) as! FavouritesViewController
        let favouriteTabBarItem = UITabBarItem(title: AppConstant.favouriteTabBarTitle, image: UIImage(systemName: ImageConstant.favourite), selectedImage: nil)
        favouriteTabBarItem.tag = TabBarType.favourite.rawValue
        favouriteVC.tabBarItem = favouriteTabBarItem
        return UINavigationController(rootViewController: favouriteVC)
    }

}
