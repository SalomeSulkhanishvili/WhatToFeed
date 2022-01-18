//
//  DailyMealCategoryCell.swift
//  WhatToFeed
//
//  Created by Salome Sulkhanishvili on 11.01.22.
//

import UIKit

class DailyMealCategoryCell: UICollectionViewCell {

    @IBOutlet private weak var categoryNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.backgroundColor = .lightBlueActionButton
        self.layer.cornerRadius = 10
    }
    
    func load(with categoryName: String) {
        categoryNameLabel.text = categoryName
    }

}
