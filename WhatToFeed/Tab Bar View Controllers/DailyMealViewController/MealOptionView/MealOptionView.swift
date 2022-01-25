//
//  MealOptionView.swift
//  WhatToFeed
//
//  Created by Salome Sulkhanishvili on 21.01.22.
//

import UIKit

protocol MealOptionsViewDelegate: AnyObject {
    func showSettings()
}

class MealOptionView: UIView {
    
    var stackView: UIStackView?
    private var options: [DailyMealOptionItem]
    var delegate: MealOptionsViewDelegate?
    
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
        options.forEach({ stack.addArrangedSubview(createOption(with: $0)) })
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
        button.setImage(.load(name: item.imageName), for: .normal)
        button.imageView?.contentMode = .scaleToFill
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addShadow(of: .black, radius: 7)
        button.addTarget(self, action: #selector(optionClicked(_:)), for: .touchUpInside)
        button.tag = item.type.rawValue
        
        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalToConstant: sideSize),
            button.widthAnchor.constraint(equalToConstant: sideSize)
        ])
        return button
    }
    
    @objc func optionClicked(_ sender: UIButton) {
        self.stackView?.arrangedSubviews.forEach({ $0.backgroundColor = .white })
        sender.backgroundColor = UIColor(hexValue: 0x90D7FF)
        // do some action here
        let itemType = MealOption(rawValue: sender.tag)
        if itemType == .settings {
            delegate?.showSettings()
        }
    }
    
    deinit {
        print("deinit - MealOptionView")
    }
    
}

enum MealOption: Int {
    case done = 1
    case start
    case description
    case share
    case settings
}

struct DailyMealOptionItem {
    
    var type: MealOption
    
    init(of type: MealOption) {
        self.type = type
    }
    
    var name: String {
        let names: [MealOption: String] = [.done : "done",
                                         .start : "start",
                                         .description: "description",
                                         .share : "share",
                                         .settings : "settings"]
        return names[type] ?? "none"
    }
    var imageName: String {
        return name + "MealOption_icon"
    }
}
