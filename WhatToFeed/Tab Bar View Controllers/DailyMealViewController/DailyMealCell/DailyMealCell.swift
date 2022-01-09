//
//  DailyMealCell.swift
//  WhatToFeed
//
//  Created by Salome Sulkhanishvili on 08.01.22.
//

import UIKit

class DailyMealCell: UICollectionViewCell {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var mealImageView: UIImageView!
    @IBOutlet weak var mealTitleLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.backgroundColor = .clear
    }
    
    func load(with: String) {
        self.mainView.layer.cornerRadius = 20
        mealImageView.layer.masksToBounds = true
        self.mainView.addShadow(of: .lightGray,
                                radius: 3,
                                offset: CGSize(width: 2, height: 2))
    }

}
