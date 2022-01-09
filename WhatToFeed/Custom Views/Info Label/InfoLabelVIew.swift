//
//  InfoLabelVIew.swift
//  WhatToFeed
//
//  Created by Salome Sulkhanishvili on 09.01.22.
//

import UIKit

class InfoLabelVIew: UIView {

    @IBOutlet weak var infoImageVIew: UIImageView!
    @IBOutlet weak var infoLabel: UILabel!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // TODO: - create struct with this input parameters
    static func load(infoText: String, infoImage: UIImage, color: UIColor) -> InfoLabelVIew {
        let infoLabelView = InfoLabelVIew()
        infoLabelView.infoImageVIew.image = infoImage
        infoLabelView.infoLabel.text = infoText
        infoLabelView.infoLabel.textColor = color
        return infoLabelView
    }

}
