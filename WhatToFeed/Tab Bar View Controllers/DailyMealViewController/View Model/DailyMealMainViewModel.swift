//
//  DailyMealMainViewModel.swift
//  WhatToFeed
//
//  Created by Salome Sulkhanishvili on 18.01.22.
//

import Foundation

protocol DailyMealMainViewModelType {
    var inputs: DailyMealMainViewModelInputs { get }
    var outputs: DailyMealMainViewModelOutputs { get }
}
protocol DailyMealMainViewModelOutputs {
    var categories: [String]? { get }
}

protocol DailyMealMainViewModelInputs {
    
}

class DailyMealMainViewModel: DailyMealMainViewModelOutputs, DailyMealMainViewModelInputs {
    var categories: [String]?
    
    init() {
        categories = ["+ Add New", "First", "Second", "Third", "Fourth", "Fifth"] // for testing purpose
    }
}

extension DailyMealMainViewModel: DailyMealMainViewModelType {
    var inputs: DailyMealMainViewModelInputs { return self }
    var outputs: DailyMealMainViewModelOutputs { return self }
}
