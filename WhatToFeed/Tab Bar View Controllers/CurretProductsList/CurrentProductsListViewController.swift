//
//  CurretProductsListViewController.swift
//  WhatToFeed
//
//  Created by Salome Sulkhanishvili on 05.01.22.
//

import UIKit

class CurrentProductsListViewController: TabBarMainController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadEmptyView(in: self.contentView)
    }
    
    static func load() -> CurrentProductsListViewController {
        let viewController = CurrentProductsListViewController()
        viewController.type = .CurrentProductsList
        return viewController
    }
    
}
