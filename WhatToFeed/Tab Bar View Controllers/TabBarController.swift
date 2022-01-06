//
//  ViewController.swift
//  WhatToFeed
//
//  Created by Salome Sulkhanishvili on 04.01.22.
//

import UIKit

// base TabBarConroller from which user can navigate to different controllers

class TabBarController: UITabBarController {

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        load()
    }
    
    // MARK: - load
    private func load(){
        setUpTabBarControllers()
        self.selectedIndex = 0
        self.tabBar.backgroundColor = .tabBarLightGray
        self.tabBar.layer.cornerRadius = 15
    }
    
    private func setUpTabBarControllers() {
        if let dailyMeal = getController(with: DailyMealViewController.load(),
                                         type: .DailyMeal),
           let curretProductsList = getController(with: CurrentProductsListViewController.load(),
                                                  type: .CurrentProductsList),
           let generalMealAndProducts = getController(with: GeneralMealsAndProductsViewController.load(),
                                                      type: .GeneralMealsAndProducts),
           let statistics = getController(with: StatisticsViewController.load(),
                                          type: .statistics) {
            
           self.viewControllers = [dailyMeal, curretProductsList, generalMealAndProducts, statistics]
        }
    }
    
    private func getController<T: UIViewController>(with controller: T?, type: TabBarItemType) -> UINavigationController? {
        guard let viewController = controller else { return nil}
        let navigationController = UINavigationController.init(rootViewController: viewController)
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.backgroundColor = .statusBarLightGray
            navigationController.navigationBar.scrollEdgeAppearance = appearance
        } else {
            // Fallback on earlier versions // TODO: change status bar color
        }
        
        if let image = UIImage(named: "WhatToFeed_with_Info_Mark") {
            let imageView = UIImageView(image: image)
            viewController.navigationItem.titleView = imageView
        } 
        let tabBarItem = UITabBarItem(title: "",
                                      image: UIImage(named: type.getImageName()),
                                      selectedImage: UIImage(named: type.getImageName()))
        navigationController.tabBarItem = tabBarItem
        return navigationController
    }
}

// MARK: - UITabBarControllerDelegate
extension TabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        // do something
    }
}

// MARK: - TabBarItemType
enum TabBarItemType: Int {
    case DailyMeal
    case CurrentProductsList
    case GeneralMealsAndProducts
    case statistics
    
    var description: String {
        switch self {
        case .DailyMeal: return "DailyMeal"
        case .CurrentProductsList: return "CurrentProductsList"
        case .GeneralMealsAndProducts: return "GeneralMealsAndProducts"
        case .statistics: return "Statistics"
        }
    }
    
    func getImageName() -> String {
        let imageName = self.description + "_icon"
        return imageName
    }
    
    func getControllerId() -> String {
        let controllerId = self.description + "ViewController"
        return controllerId
    }
}
