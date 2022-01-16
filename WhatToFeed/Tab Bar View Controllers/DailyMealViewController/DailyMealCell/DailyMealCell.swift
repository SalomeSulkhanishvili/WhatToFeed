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
    
    @IBOutlet weak var portionView: UIView!
    @IBOutlet weak var timeView: UIView!
    @IBOutlet weak var foodRecipeView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.backgroundColor = .clear
        [portionView,timeView,foodRecipeView].forEach({
            $0?.backgroundColor = .clear
        })
        
    }
    
    func load(with: String) {
        self.mainView.layer.cornerRadius = 20 * UIDevice.screenFactor
        mealImageView.layer.masksToBounds = true
        self.mainView.addShadow(of: .lightGray,
                                radius: 3,
                                offset: CGSize(width: 2, height: 2))
        loadInfoViews()
    }
    
    private func loadInfoViews() {
        [portionView,timeView,foodRecipeView].forEach({
            $0?.subviews.forEach({$0.removeFromSuperview()})
        })
        portionView.addSubview(InfoLabelView.load(value: "5", type: .portion))
        timeView.addSubview(InfoLabelView.load(value: "4", type: .clock))
        
        let recipe = InfoLabelView.load(type: .foodRecipe)
        recipe.frame = foodRecipeView.bounds
        foodRecipeView.addSubview(recipe)
    }
}
