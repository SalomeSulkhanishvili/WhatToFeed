//
//  StatisticsViewController.swift
//  WhatToFeed
//
//  Created by Salome Sulkhanishvili on 05.01.22.
//

import UIKit

class StatisticsMainViewController: TabBarMainController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadEmptyView(in: self.contentView)
    }
    
    static func load() -> StatisticsMainViewController {
        let viewController = StatisticsMainViewController(type: .statistics)
        return viewController
    }
}
