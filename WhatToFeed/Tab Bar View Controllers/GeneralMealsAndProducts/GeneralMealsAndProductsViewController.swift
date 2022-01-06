//
//  GeneralMealsAndProductsViewController.swift
//  WhatToFeed
//
//  Created by Salome Sulkhanishvili on 05.01.22.
//

import UIKit

class GeneralMealsAndProductsViewController: UIViewController {

    @IBOutlet weak var contentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadEmptyView()
        // Do any additional setup after loading the view.
    }
    
    private func loadEmptyView() {
        let emptyView = EmptyFlowTemplate.load(with: EmptyFlowItem(.GeneralMealsAndProducts))
        emptyView.frame = self.contentView.bounds
        self.contentView.addSubview(emptyView)
        emptyView.sizeToFit()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
