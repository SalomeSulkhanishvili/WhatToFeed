//
//  DailyMealViewController.swift
//  WhatToFeed
//
//  Created by Salome Sulkhanishvili on 05.01.22.
//

import UIKit

class DailyMealMainViewController: TabBarMainController {
    
    private lazy var greetingTitleLabel: UILabel = { loadGreetingTitleLabel() }()
    private lazy var subTitleLabel: UILabel = { loadSubTitleLabel() }()
    private lazy var collectionsView: DailyMealCollectionsView = { loadCollectionsView() }()
    private weak var pullUpView: PullUpViewController?
    private var viewModel: DailyMealMainViewModelType?
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.loadEmptyView(in: self.contentView)
        DispatchQueue.main.async { [weak self] in
            self?.loadDailyMealViews()
        }
        // loadController(GeneralMealsAndProductsViewController.load())
    }
    
    // MARK: - init
    static func load(with viewModel: DailyMealMainViewModelType?) -> DailyMealMainViewController {
        let viewController = DailyMealMainViewController(type: .DailyMeal)
        viewController.viewModel = viewModel
        return viewController
    }
    
    private func loadDailyMealViews() {
        contentView.addSubview(greetingTitleLabel)
        contentView.addSubview(subTitleLabel)
        contentView.addSubview(collectionsView)
        setConstraints()
    }
    
    deinit {
        print("deinit - \(self.className)")
    }
}

// MARK: SetUp UI components
extension DailyMealMainViewController {
    private func loadGreetingTitleLabel() -> UILabel {
        let title = UILabel()
        title.numberOfLines = 1
        title.font = UIFont.aleo(type: .bold, size: 13)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.attributedText = viewModel?.outputs.title
        return title
    }
    
    private func loadSubTitleLabel() -> UILabel {
        let subTitle = UILabel()
        subTitle.numberOfLines = 0
        subTitle.font = UIFont.aleo(type: .bold, size: 13)
        subTitle.textColor = .darkBlue
        subTitle.translatesAutoresizingMaskIntoConstraints = false
        subTitle.text = viewModel?.outputs.subTitle
        subTitle.addSpacing()
        return subTitle
    }
    
    private func loadCollectionsView() -> DailyMealCollectionsView {
        let collectionsView = DailyMealCollectionsView.load(viewModel: viewModel)
        collectionsView.delegate = self
        return collectionsView
    }
    
    private func loadPullUp() {
        pullUpView = PullUpViewController.load(with: PullUpTableView(),
                                                         height: 150,
                                                         superViewHeight: self.contentView.frame.height)
        guard let pullUp = pullUpView else { return }
        self.contentView.addSubview(pullUp.view)
        self.addChild(pullUp)
        pullUp.didMove(toParent: self)
    }
}

// MARK: - DailyMealCollectionsViewDelegate
extension DailyMealMainViewController: DailyMealCollectionsViewDelegate {
    func showPullUp() {
        loadPullUp()
    }
    
    func removePullUp() {
        pullUpView?.closePullUp()
    }
    
    func optionsView(isVisible: Bool) {
        if isVisible {
            self.contentView.highlight(for: self.collectionsView, color: .backgroundForHighlight)
        } else {
            self.contentView.removeLayer(of: .highlighter)
        }
    }
}

// MARK: SetUp Constraints
extension DailyMealMainViewController {
    private func setConstraints(){
        NSLayoutConstraint.activate([
            greetingTitleLabel.topAnchor.constraint(equalTo: contentView.safeTopAnchor,
                                                    constant: 14 * UIDevice.screenFactor),
            greetingTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                                        constant: 20 * UIDevice.screenFactor),
            greetingTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                                         constant: -20 * UIDevice.screenFactor)
        ])
        
        NSLayoutConstraint.activate([
            subTitleLabel.topAnchor.constraint(equalTo: greetingTitleLabel.bottomAnchor,
                                               constant: 7 * UIDevice.screenFactor),
            subTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                                   constant: 20 * UIDevice.screenFactor),
            subTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                                    constant: -20 * UIDevice.screenFactor)
        ])
        
        NSLayoutConstraint.activate([
            collectionsView.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor),
            collectionsView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionsView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionsView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
