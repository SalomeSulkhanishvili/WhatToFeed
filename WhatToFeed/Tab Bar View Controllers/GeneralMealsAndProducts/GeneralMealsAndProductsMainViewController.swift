//
//  GeneralMealsAndProductsViewController.swift
//  WhatToFeed
//
//  Created by Salome Sulkhanishvili on 05.01.22.
//

import UIKit

class GeneralMealsAndProductsMainViewController: TabBarMainController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadEmptyView(in: self.contentView)
    }
    
    static func load() -> GeneralMealsAndProductsMainViewController {
        let viewController = GeneralMealsAndProductsMainViewController(type: .GeneralMealsAndProducts)
        return viewController
    }
}
