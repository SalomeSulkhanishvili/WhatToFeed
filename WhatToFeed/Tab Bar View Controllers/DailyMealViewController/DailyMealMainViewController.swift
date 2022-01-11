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
    
    private let dailyMealCellHeight: CGFloat = 400
    private let categoryCellHeight: CGFloat = 40
    
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
            return cell
        }
    }
}

// MARK: SetUp UI components
extension DailyMealMainViewController {
    private func loadGreetingTitleLabel() -> UILabel {
        let title = UILabel()
        title.numberOfLines = 1
        title.font = UIFont(name: "Aleo-Bold", size: 13)
        title.text = "Hello Max charles"
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }
    
    private func loadSubTitleLabel() -> UILabel {
        let subTitle = UILabel()
        subTitle.numberOfLines = 0
        subTitle.font = UIFont(name: "Aleo-Bold", size: 13)
        subTitle.text = "are you going to start cooking? you know someone have to cook and I guess you are the one who is willing to sucrifice"
        subTitle.translatesAutoresizingMaskIntoConstraints = false
        return subTitle
    }
    
    private func loadCategoryCollectionView() -> UICollectionView {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let width = categoryCellHeight * (10/4) // 100 : 40
        layout.itemSize = CGSize(width: width, height: categoryCellHeight)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
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
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let width: CGFloat = dailyMealCellHeight * 0.575 // 230 : 400
        layout.itemSize = CGSize(width: width, height: dailyMealCellHeight)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
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
                                                    constant: 14),
            greetingTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                                        constant: 20),
            greetingTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                                         constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            subTitleLabel.topAnchor.constraint(equalTo: greetingTitleLabel.bottomAnchor,
                                               constant: 7),
            subTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                                   constant: 20),
            subTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                                    constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            categoryCollectionView.heightAnchor.constraint(equalToConstant: (categoryCellHeight + 10)),
            categoryCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            categoryCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            categoryCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,
                                                           constant: -14)
        ])
        
        NSLayoutConstraint.activate([
            dailyMealCollectionView.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor,
                                                         constant: 10),
            dailyMealCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            dailyMealCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            dailyMealCollectionView.bottomAnchor.constraint(equalTo: categoryCollectionView.topAnchor,
                                                            constant: -22)
        ])
        
        dailyMealCollectionView.reloadData()
        categoryCollectionView.reloadData()
    }
}
