//
//  DailyMealViewController.swift
//  WhatToFeed
//
//  Created by Salome Sulkhanishvili on 05.01.22.
//

import UIKit

class DailyMealMainViewController: TabBarMainController {
    
    private lazy var dailyMealCollectionView: UICollectionView = { loadDailyMealCollectionView() }()
    private lazy var categoryCollectionView: UICollectionView = { loadCategoryCollectionView() }()
    private lazy var greetingTitleLabel: UILabel = { loadGreetingTitleLabel() }()
    private lazy var subTitleLabel: UILabel = { loadSubTitleLabel() }()
    
    private let dailyMealCellHeight: CGFloat = 400 * UIDevice.screenFactor
    private let categoryCellHeight: CGFloat = 40 * UIDevice.screenFactor
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.loadEmptyView(in: self.contentView)
        DispatchQueue.main.async { [weak self] in
            self?.loadDailyMealViews()
        }
        // loadController(GeneralMealsAndProductsViewController.load())
    }
    
    static func load() -> DailyMealMainViewController {
        let viewController = DailyMealMainViewController(type: .DailyMeal)
        return viewController
    }
    
    private func loadDailyMealViews() {
        contentView.addSubview(dailyMealCollectionView)
        contentView.addSubview(categoryCollectionView)
        contentView.addSubview(greetingTitleLabel)
        contentView.addSubview(subTitleLabel)
        setCollectionViewConstraints()
    }
}

// MARK: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
extension DailyMealMainViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == dailyMealCollectionView {
            let height = collectionView.frame.height - 20
            let width = height * 0.575 // 230 : 400
            return CGSize(width: width, height: height)
        } else {
            let width = categoryCellHeight * (10/4) // 100 : 40
            return CGSize(width: width, height: categoryCellHeight)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.dailyMealCollectionView {
            return 5 // just for testing purpose
        } else {
            return 10
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.dailyMealCollectionView {
            let cell: DailyMealCell = dailyMealCollectionView.dequeueReusableCell(for: indexPath)
            cell.load(with: "")
            return cell
        } else {
            let cell: DailyMealCategoryCell = categoryCollectionView.dequeueReusableCell(for: indexPath)
            cell.load()
            return cell
        }
    }
}

// MARK: SetUp UI components
extension DailyMealMainViewController {
    private func loadGreetingTitleLabel() -> UILabel {
        let title = UILabel()
        title.numberOfLines = 1
        title.font = UIFont.aleo(type: .bold, size: 13)
        title.text = "Hello Max charles"
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }
    
    private func loadSubTitleLabel() -> UILabel {
        let subTitle = UILabel()
        subTitle.numberOfLines = 0
        subTitle.font = UIFont.aleo(type: .bold, size: 13)
        subTitle.textColor = .darkBlue
        subTitle.text = "are you going to start cooking? you know someone have to cook and I guess you are the one who is willing to sucrifice"
        subTitle.translatesAutoresizingMaskIntoConstraints = false
        return subTitle
    }
    
    private func loadCategoryCollectionView() -> UICollectionView {
        let sideEndge = 20 * UIDevice.screenFactor
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: sideEndge, bottom: 0, right: sideEndge)
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.registerCell(withType: DailyMealCategoryCell.self)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }
    
    private func loadDailyMealCollectionView() -> UICollectionView {
        let sideEndge = 20 * UIDevice.screenFactor
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: sideEndge, bottom: 0, right: sideEndge)
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.registerCell(withType: DailyMealCell.self)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }
}

// MARK: SetUp Constraints
extension DailyMealMainViewController {
    private func setCollectionViewConstraints(){
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
            categoryCollectionView.heightAnchor.constraint(equalToConstant: categoryCellHeight + 10),
            categoryCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            categoryCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            categoryCollectionView.bottomAnchor.constraint(equalTo: contentView.safeBottomAnchor,
                                                           constant: -10 * UIDevice.screenFactor)
        ])
        
        NSLayoutConstraint.activate([
            dailyMealCollectionView.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor,
                                                         constant: 5 * UIDevice.screenFactor),
            dailyMealCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            dailyMealCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            dailyMealCollectionView.bottomAnchor.constraint(equalTo: categoryCollectionView.topAnchor, constant: -10)
        ])
        
        dailyMealCollectionView.reloadData()
        categoryCollectionView.reloadData()
    }
}
