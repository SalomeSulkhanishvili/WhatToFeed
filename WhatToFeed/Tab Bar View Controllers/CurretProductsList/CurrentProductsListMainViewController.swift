//
//  CurretProductsListViewController.swift
//  WhatToFeed
//
//  Created by Salome Sulkhanishvili on 05.01.22.
//

import UIKit

class CurrentProductsListMainViewController: TabBarMainController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadEmptyView(in: self.contentView)
    }
    
    static func load() -> CurrentProductsListMainViewController {
        let viewController = CurrentProductsListMainViewController(type: .CurrentProductsList)
        return viewController
    }
    
}
