//
//  EmptyFlowItem.swift
//  WhatToFeed
//
//  Created by Salome Sulkhanishvili on 06.01.22.
//

import Foundation
import UIKit

// TODO: change dictionaries with appropriate keys in localized
// after implementing strings wiht localized create keys such as it became much easier to take
// such as type.description + "_title"/ "_buttonTitle"so it will become much easier to take them and not use this dictionaries which complicate things

struct EmptyFlowItem {
    var title: String
    var subTitle: String
    var imageName: String
    var actionButtonTitle: String?
    
    init(_ type: TabBarItemType) {
        self.title = EmptyFlowItem.getTitle(for: type)
        self.subTitle = EmptyFlowItem.getSubTitlte(for: type)
        self.imageName = type.description + "_EmptyTemplate_icon"
        self.actionButtonTitle = EmptyFlowItem.getActionButtonTitle(for: type)
    }
    
    var image: UIImage {
        return UIImage.load(name: self.imageName)
    }
    
    static func getTitle(for type: TabBarItemType) -> String {
        let titles: [TabBarItemType: String] = [.DailyMeal: "Are not you cooking today?",
                                                .CurrentProductsList: "Your list is empty for today",
                                                .GeneralMealsAndProducts: "There is no Product ",
                                                .statistics: "No statistics"]
        return titles[type] ?? ""
    }
    
    static func getSubTitlte(for type: TabBarItemType) -> String {
        let subTitles: [TabBarItemType: String] = [.DailyMeal: "you can go in your foods recipie section and choose foods that you  are going to cook or if you have not added any you can add at first and than choose",
                                                   .CurrentProductsList: "add products in your list. are you serious? you do not want to buy something for today? ",
                                                   .GeneralMealsAndProducts: "To see product and there history order daily and write your list.",
                                                   .statistics: "To see products and their history order daily and write your list."]
        return subTitles[type] ?? ""
    }
    
    static func getActionButtonTitle(for type: TabBarItemType) -> String? {
        let buttonTitltes: [TabBarItemType: String] = [.DailyMeal: "Choose Food",
                                                       .CurrentProductsList: "Add Product",
                                                       .GeneralMealsAndProducts: "Add Product"]
        return buttonTitltes[type]
    }
}
