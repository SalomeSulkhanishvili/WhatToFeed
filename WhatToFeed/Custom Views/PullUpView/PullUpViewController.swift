//
//  PullUpViewController.swift
//  WhatToFeed
//
//  Created by Salome Sulkhanishvili on 26.01.22.
//

import UIKit

class PullUpViewController: UIViewController {

    private var viewHeightConstraint: NSLayoutConstraint?
    private var contentView = UIView()
    private var defaultHeight: CGFloat = 100
    private var superViewHeight: CGFloat?
    
    static func load(with controller: UIViewController, height: CGFloat, superViewHeight: CGFloat) -> PullUpViewController {
        let pullUp = PullUpViewController()
        pullUp.defaultHeight = height
        pullUp.superViewHeight = superViewHeight
        pullUp.setUp(with: height, superViewHeight: superViewHeight)
        pullUp.addView(controller: controller)
        return pullUp
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        self.view.layer.cornerRadius = 30
        self.view.layer.masksToBounds = true
    }
    
    private func setUp(with height: CGFloat, superViewHeight: CGFloat) {
        contentView.backgroundColor = .clear
        contentView.translatesAutoresizingMaskIntoConstraints = false
        self.view.frame = CGRect(x: 0,
                                 y: superViewHeight,
                                 width: UIScreen.main.bounds.width,
                                 height: height)

        UIView.animate(withDuration: 0.2, animations: {
            self.view.frame.origin.y = superViewHeight - height
        })
        
        self.view.addSubview(contentView)
        contentView.frame = self.view.bounds
    }
    
    func closePullUp() {
        UIView.animate(withDuration: 0.2, animations: {
            self.view.frame.origin.y = self.superViewHeight ?? 0
        }, completion: {_ in
            self.view.removeFromSuperview()
            self.removeFromParent()
            self.willMove(toParent: nil)
        })
    }
    
    private func addView(controller: UIViewController) {
        self.contentView.addSubview(controller.view)
        controller.view.frame = self.view.bounds
        self.addChild(controller)
        controller.didMove(toParent: self)
    }
    
    deinit {
        print("deinit - PullUpViewController")
    }

}
