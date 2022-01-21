//
//  DailyMealMainViewModel.swift
//  WhatToFeed
//
//  Created by Salome Sulkhanishvili on 18.01.22.
//

import Foundation
import UIKit

protocol DailyMealMainViewModelType {
    var inputs: DailyMealMainViewModelInputs { get }
    var outputs: DailyMealMainViewModelOutputs { get }
}
protocol DailyMealMainViewModelOutputs {
    var categories: [String]? { get }
    var dailyMeals: [DailyMeal] { get }
    var dailyMealOptions: [DailyMealOptionItem] { get }
    var title: NSAttributedString? { get }
    var subTitle: String? { get }
    var isCellSelected: Bool { get }
}

protocol DailyMealMainViewModelInputs {
    func changeDailyMealSelection(with row: Int?)
}

class DailyMealMainViewModel: DailyMealMainViewModelOutputs, DailyMealMainViewModelInputs {
    
    
    var categories: [String]?
    var dailyMeals: [DailyMeal] = []
    var dailyMealOptions: [DailyMealOptionItem] = []
    var title: NSAttributedString?
    var subTitle: String?
    var isCellSelected: Bool = false
    
    init() {
        categories = ["+ Add New", "First", "Second", "Third", "Fourth", "Fifth"] // for testing purpose
        dailyMeals = [DailyMeal(),DailyMeal(),DailyMeal(),DailyMeal(),DailyMeal()]
        dailyMealOptions = [DailyMealOptionItem(of: .done),
                            DailyMealOptionItem(of: .start),
                            DailyMealOptionItem(of: .description),
                            DailyMealOptionItem(of: .share),
                            DailyMealOptionItem(of: .settings)]
        self.initComponents()
    }
    
    private func initComponents() {
        title = NSAttributedString.customText(with: ["Hello".customString(with: .mainPurple),
                                                     "Max charles".customString(with: .mainOrange)],
                                              font: UIFont.aleo(type: .bold, size: 13))
        subTitle = "are you going to start cooking? you know someone have to cook and I guess you are the one who is willing to sucrifice"
    }
    
    func changeDailyMealSelection(with row: Int?) {
        isCellSelected = false
        dailyMeals.forEach({ $0.isSelected = false })
        if let index = row {
            dailyMeals[index].isSelected = true
            isCellSelected = true
        }
    }
}

extension DailyMealMainViewModel: DailyMealMainViewModelType {
    var inputs: DailyMealMainViewModelInputs { return self }
    var outputs: DailyMealMainViewModelOutputs { return self }
}
