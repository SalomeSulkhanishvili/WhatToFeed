//
//  DailyMealViewController.swift
//  WhatToFeed
//
//  Created by Salome Sulkhanishvili on 05.01.22.
//

import UIKit

class DailyMealMainViewController: TabBarMainController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadEmptyView(in: self.contentView)
        // loadController(GeneralMealsAndProductsViewController.load())
    }
    
    static func load() -> DailyMealMainViewController {
        let viewController = DailyMealMainViewController(type: .DailyMeal)
        return viewController
    }
    
}
