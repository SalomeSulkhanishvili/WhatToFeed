//
//  TabBarMainController.swift
//  WhatToFeed
//
//  Created by Salome Sulkhanishvili on 07.01.22.
//

import Foundation
import UIKit

class TabBarMainController: UIViewController, TabBarViewControllerProtocol {
    
    var type: TabBarItemType
    var contentView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadContentView()
        self.updateNavigationViewController()
        self.view.backgroundColor = .white
    }
    
    init(type: TabBarItemType) {
        self.type = type
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func loadContentView() {
        contentView.backgroundColor = .clear
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(contentView)
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.safeTopAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.safeBottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.safeLeandingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.safeTrailingAnchor)
        ])
    }
    
    private func updateNavigationViewController() {
        guard let navigationController = self.navigationController else { return }
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.backgroundColor = .statusBarLightGray
            navigationController.navigationBar.scrollEdgeAppearance = appearance
        } else {
            // Fallback on earlier versions // TODO: change status bar color
        }
        
        let image = UIImage.load(name: "WhatToFeed_with_Info_Mark")
        let imageView = UIImageView(image: image)
        self.navigationItem.titleView = imageView
    }
    
    func loadController(_ viewController: UIViewController, animated: Bool = false) {
        self.navigationController?.pushViewController(viewController, animated: animated)
    }
    
    deinit {
        print("deinit - \(self.className)")
    }
}

protocol TabBarViewControllerProtocol: AnyObject {
    var type: TabBarItemType { get }
    var contentView: UIView { get }
    func loadEmptyView(in contentView: UIView?)
    func loadController(_ viewController: UIViewController, animated: Bool)
}

extension TabBarViewControllerProtocol {
    func loadEmptyView(in contentView: UIView?) {
        guard let view = contentView else { return }
        let emptyView = EmptyFlowTemplate.load(with: EmptyFlowItem(type))
        emptyView.frame = view.bounds
        view.addSubview(emptyView)
        emptyView.sizeToFit()
    }
}
