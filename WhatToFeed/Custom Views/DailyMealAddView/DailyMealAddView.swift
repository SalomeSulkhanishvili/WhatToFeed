//
//  DailyMealAddView.swift
//  WhatToFeed
//
//  Created by Salome Sulkhanishvili on 24.01.22.
//

import UIKit

class DailyMealAddView: UIView {
    
    private var stackView: UIStackView?
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createUIComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createUIComponents() {
        loadStackView()
        
        let titleLabel = UILabel()
        titleLabel.text = "Add Food"
        titleLabel.font = UIFont.aleo(type: .bold, size: 18)
        titleLabel.textColor = UIColor(hexValue: 0x2F3592)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let imageView = UIImageView()
        imageView.image = UIImage.load(name: "DailyMealAddCell")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 140 * UIDevice.screenFactor),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor)
        ])
        
        guard let stackView = stackView else { return }
        
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(imageView)
    }
    
    private func loadStackView() {
        stackView = UIStackView(frame: frame)
        stackView?.alignment = .center
        stackView?.distribution = .fill
        stackView?.contentMode = .scaleToFill
        stackView?.spacing = 20 * UIDevice.screenFactor
        stackView?.axis = .vertical
        stackView?.translatesAutoresizingMaskIntoConstraints = false
        
        guard let stackView = stackView else { return }
        self.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
}
