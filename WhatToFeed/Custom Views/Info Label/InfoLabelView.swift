//
//  InfoLabelVIew.swift
//  WhatToFeed
//
//  Created by Salome Sulkhanishvili on 09.01.22.
//

import UIKit

class InfoLabelView: UIView {

    @IBOutlet weak var infoImageVIew: UIImageView!
    @IBOutlet weak var infoLabel: UILabel!
    
    var type: Info?
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // TODO: - create struct with this input parameters
    static func load(value: String = "", type info: Info?) -> UIView {
        let infoLabelView = InfoLabelView.loadFromNib()
        infoLabelView.type = info
        infoLabelView.initialize(with: value)
        return infoLabelView
    }
    
    private func initialize(with value: String) {
        guard let info = type else { return }
        infoImageVIew.image = UIImage.load(name: info.imageName)
        infoLabel.text = value + " " + info.description
        infoLabel.textColor = info.color
    }
    
    enum Info: String {
        case portion = "portion"
        case clock = "clock"
        case foodRecipe = "foodRecipe"
        
        var description: String {
            switch self {
            case .portion:      return "Portion"
            case .clock:        return "Minutes"
            case .foodRecipe:   return "Food Recipe"
            }
        }
        var imageName: String {
            return self.rawValue + "_icon"
        }
        
        var color: UIColor {
            switch self {
            case .portion:      return UIColor(hexValue: 0x1645EE)
            case .clock:        return UIColor(hexValue: 0x282366)
            case .foodRecipe:   return UIColor(hexValue: 0xD84343)
            }
        }
    }
}
