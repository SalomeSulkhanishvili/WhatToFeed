//
//  DailyMealViewController.swift
//  WhatToFeed
//
//  Created by Salome Sulkhanishvili on 05.01.22.
//

import UIKit

class DailyMealViewController: TabBarMainController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadEmptyView(in: self.contentView)
        // loadController(GeneralMealsAndProductsViewController.load())
    }
    
    static func load() -> DailyMealViewController {
        let viewController = DailyMealViewController()
        viewController.type = .DailyMeal
        return viewController
    }

}
