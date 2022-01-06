//
//  DailyMealViewController.swift
//  WhatToFeed
//
//  Created by Salome Sulkhanishvili on 05.01.22.
//

import UIKit

class DailyMealViewController: UIViewController {

    @IBOutlet weak var contentView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadEmptyView()
    }
    
    private func loadEmptyView() {
        let emptyView = EmptyFlowTemplate.load(with: EmptyFlowItem(.DailyMeal))
        emptyView.frame = self.contentView.bounds
        self.contentView.addSubview(emptyView)
        emptyView.sizeToFit()
    }

}

