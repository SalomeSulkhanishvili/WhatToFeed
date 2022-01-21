//
//  MealOptionView.swift
//  WhatToFeed
//
//  Created by Salome Sulkhanishvili on 21.01.22.
//

import UIKit

class MealOptionView: UIView {
    
    var stackView: UIStackView?
    private var options: [DailyMealOptionItem]
    


    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }

    
    init(frame: CGRect, options: [DailyMealOptionItem]) {
        self.options = options
        super.init(frame: frame)
        stackView = UIStackView(frame: CGRect(x: 0,
                                              y: 0,
                                              width: self.bounds.width,
                                              height: self.bounds.height))
        stackView?.alignment = .fill
        stackView?.axis = .vertical
        stackView?.distribution = .fillEqually
        stackView?.spacing = 15 * UIDevice.screenFactor
        stackView?.translatesAutoresizingMaskIntoConstraints = false
        guard let stack = stackView else { return }
        self.addSubview(stack)
        stack.addArrangedSubview(createOption(with: DailyMealOptionItem()))
        stack.addArrangedSubview(createOption(with: DailyMealOptionItem()))
        stack.addArrangedSubview(createOption(with: DailyMealOptionItem()))

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }

    
    private func createOption(with item: DailyMealOptionItem) -> UIButton {
        let button = UIButton()
        let sideSize = self.bounds.width
        button.backgroundColor = .white
        button.clipsToBounds = true
        button.layer.cornerRadius = sideSize / 2
        button.setImage(.load(name: "no_image"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.imageEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        button.addTarget(self, action: #selector(optionClicked(_:)), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalToConstant: sideSize),
            button.widthAnchor.constraint(equalToConstant: sideSize)
        ])
        return button
    }
    
    @objc func optionClicked(_ sender: UIButton) {
        // clicked
    }
    
    deinit {
        print("deinit - MealOptionView")
    }
    
}

struct DailyMealOptionItem {
    var name: String?
    var imageName: String?
}
