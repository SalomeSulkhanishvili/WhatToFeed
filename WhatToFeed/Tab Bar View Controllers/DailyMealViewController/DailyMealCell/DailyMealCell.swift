//
//  DailyMealCell.swift
//  WhatToFeed
//
//  Created by Salome Sulkhanishvili on 08.01.22.
//

import UIKit

class DailyMealCell: UICollectionViewCell {

    @IBOutlet private weak var mainView: UIView!
    @IBOutlet private weak var mealImageView: UIImageView!
    @IBOutlet private weak var mealTitleLabel: UILabel!
    @IBOutlet private weak var ingredientStackView: UIStackView!
    @IBOutlet private weak var foodDescriptionLabel: UILabel!
    @IBOutlet private weak var portionView: UIView!
    @IBOutlet private weak var timeView: UIView!
    @IBOutlet private weak var foodRecipeView: UIView!
    
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
        mealTitleLabel.addSpacing()
        foodDescriptionLabel.addSpacing()
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
