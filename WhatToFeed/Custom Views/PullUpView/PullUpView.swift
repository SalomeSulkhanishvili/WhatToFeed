//
//  PullUpView.swift
//  WhatToFeed
//
//  Created by Salome Sulkhanishvili on 24.01.22.
//

import UIKit

class PullUpView: UIView {
    
    
    var viewHeightConstraint: NSLayoutConstraint?
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .orange
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // TODO: animation
    func setUpView() {
        guard let superView = superview else { return }
        NSLayoutConstraint.activate([
            self.leadingAnchor.constraint(equalTo: superView.safeLeandingAnchor),
            self.trailingAnchor.constraint(equalTo: superView.safeTrailingAnchor),
            self.bottomAnchor.constraint(equalTo: superView.safeBottomAnchor)

        ])
        self.layoutIfNeeded()
        viewHeightConstraint = self.heightAnchor.constraint(equalToConstant: 150)
        viewHeightConstraint?.isActive = true
    
        UIView.animate(withDuration: 5, animations: {
            
            self.layoutIfNeeded()
           
        })
    }
}
