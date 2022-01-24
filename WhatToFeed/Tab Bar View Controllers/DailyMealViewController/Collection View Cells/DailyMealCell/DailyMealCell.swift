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
    private var transparentView = UIView()
    private var dailyMealAddView: DailyMealAddView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.backgroundColor = .clear
        [portionView,timeView,foodRecipeView].forEach({
            $0?.backgroundColor = .clear
        })
    }
    
    func load(with item: DailyMeal? = nil, addShadow: Bool) {
        dailyMealAddView?.removeFromSuperview()
        
        if let _ = item { // geenral daily Meal cell configuration
            mainView.subviews.forEach({ $0.isHidden = false })
            self.mainView.layer.cornerRadius = 20 * UIDevice.screenFactor
            mealImageView.layer.masksToBounds = true
            self.backgroundColor = .clear
            self.mainView.addShadow(of: .lightGray,
                                    radius: 3,
                                    offset: CGSize(width: 2, height: 2))
            loadInfoViews()
            mealTitleLabel.addSpacing()
            foodDescriptionLabel.addSpacing()
        } else { // template for adding new meal
            mainView.subviews.forEach({ $0.isHidden = true })
            dailyMealAddView = DailyMealAddView(frame: self.mainView.bounds)
            guard let addMealView = dailyMealAddView else { return }
            mainView.addSubview(addMealView)
        }
        
        if self.contentView.subviews.contains(transparentView) {
            transparentView.removeFromSuperview()
        }
        if addShadow, !(item?.isSelected ?? false) { addShadowView() }
    }
    
    func addShadowView() {
        self.contentView.addSubview(transparentView)
        transparentView.backgroundColor = .backgroundForHighlight
        transparentView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            transparentView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            transparentView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            transparentView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            transparentView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
        ])
        self.backgroundColor = .white
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
