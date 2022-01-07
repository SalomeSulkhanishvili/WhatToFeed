//
//  TabBarMainController.swift
//  WhatToFeed
//
//  Created by Salome Sulkhanishvili on 07.01.22.
//

import Foundation
import UIKit

protocol TabBarViewControllerProtocol: AnyObject {
    var type: TabBarItemType? { get }
    var contentView: UIView { get }
    func loadEmptyView(in contentView: UIView?)
    func loadController(_ viewController: UIViewController, animated: Bool)
}

extension TabBarViewControllerProtocol {
    func loadEmptyView(in contentView: UIView?) {
        guard let type = type, let view = contentView else { return }
        let emptyView = EmptyFlowTemplate.load(with: EmptyFlowItem(type))
        emptyView.frame = view.bounds
        view.addSubview(emptyView)
        emptyView.sizeToFit()
    }
}

class TabBarMainController: UIViewController, TabBarViewControllerProtocol {
    
    var type: TabBarItemType?
    var contentView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadContentView()
        self.view.backgroundColor = .white
    }
    
    private func loadContentView() {
        contentView.backgroundColor = .clear
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        let guide = self.view.safeAreaLayoutGuide
        self.view.addSubview(contentView)
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: guide.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: guide.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: guide.trailingAnchor)
        ])
    }
    
    func loadController(_ viewController: UIViewController, animated: Bool = false) {
        self.navigationController?.pushViewController(viewController, animated: animated)
    }
}
