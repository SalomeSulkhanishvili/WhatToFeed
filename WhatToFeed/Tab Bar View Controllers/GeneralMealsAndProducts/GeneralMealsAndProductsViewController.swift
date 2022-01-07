//
//  GeneralMealsAndProductsViewController.swift
//  WhatToFeed
//
//  Created by Salome Sulkhanishvili on 05.01.22.
//

import UIKit

class GeneralMealsAndProductsViewController: TabBarMainController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadEmptyView(in: self.contentView)
    }
    
    static func load() -> GeneralMealsAndProductsViewController {
        let viewController = GeneralMealsAndProductsViewController()
        viewController.type = .GeneralMealsAndProducts
        return viewController
    }
}
