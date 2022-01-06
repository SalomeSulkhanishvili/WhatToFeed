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

    @IBOutlet private weak var tempalteImageView: UIImageView!
    @IBOutlet private weak var templateTitleLabel: UILabel!
    @IBOutlet private weak var templateSubtitleLabel: UILabel!
    @IBOutlet private weak var templateActionButton: UIButton!
    
    private var item: EmptyFlowItem?
    
    var delegate: EmptyFlowOutputDelegate?
    
    // MARK: - lifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    static func load(with item: EmptyFlowItem) -> UIView {
        let emptyTemplateView = EmptyFlowTemplate.loadFromNib()
        emptyTemplateView.item = item
        emptyTemplateView.initialization()
        return emptyTemplateView
    }
    
    private func initialization() {
        templateActionButton.layer.cornerRadius = templateActionButton.frame.height / 2
        tempalteImageView.image = item?.image
        templateTitleLabel.text = item?.title
        templateSubtitleLabel.text = item?.subTitle
        
        if let buttonTittle = item?.actionButtonTitle {
            templateActionButton.setTitle(buttonTittle, for: .normal)
        } else {
            templateActionButton.isHidden = true
        }
    }
    
    @IBAction func clickOnActionButton(_ sender: UIButton) {
        delegate?.didClickOnActionButton()
    }
}
