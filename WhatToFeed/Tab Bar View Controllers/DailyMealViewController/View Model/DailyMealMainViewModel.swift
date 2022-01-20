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
    var isCellSelected: Bool { get }
}

protocol DailyMealMainViewModelInputs {
    func changeDailyMealSelection(with row: Int?)
}

class DailyMeal {
    var name: String?
    var description: String?
    var portion: Int?
    var time: Int?
    var products: [String]?
    
    var isSelected = false
}

class DailyMealMainViewModel: DailyMealMainViewModelOutputs, DailyMealMainViewModelInputs {
    
    var categories: [String]?
    var dailyMeals: [DailyMeal] = []
    var isCellSelected: Bool = false
    
    init() {
        categories = ["+ Add New", "First", "Second", "Third", "Fourth", "Fifth"] // for testing purpose
        dailyMeals = [DailyMeal(),DailyMeal(),DailyMeal(),DailyMeal(),DailyMeal()]
        
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
