//
//  EmptyFlowTemplate.swift
//  WhatToFeed
//
//  Created by Salome Sulkhanishvili on 06.01.22.
//

import UIKit

protocol EmptyFlowOutputDelegate {
    func didClickOnActionButton()
}
class EmptyFlowTemplate: UIView {
    

    @IBOutlet weak var tempalteImageView: UIImageView!
    
    @IBOutlet weak var templateTitleLabel: UILabel!
    @IBOutlet weak var templateSubtitleLabel: UILabel!
    @IBOutlet weak var templateActionButton: UIButton!
    
    var delegate: EmptyFlowOutputDelegate?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        templateActionButton.layer.cornerRadius = 47
    }
    
    
    @IBAction func clickOnActionButton(_ sender: UIButton) {
        delegate?.didClickOnActionButton()
    }
}
