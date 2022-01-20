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
    
    private var categoryCellSize: CGSize {
        let height = 40 * UIDevice.screenFactor
        let width = height * (10/4) // 100 : 40
        return CGSize(width: width, height: height)
    }
    
    private var dailyMealCellSize: CGSize {
        let height = dailyMealCollectionView.frame.height - 20
        let width = height * 0.575 // 230 : 400
        return CGSize(width: width, height: height)
    }

    private var viewModel: DailyMealMainViewModelType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.loadEmptyView(in: self.contentView)
        DispatchQueue.main.async { [weak self] in
            self?.loadDailyMealViews()
        }
        // loadController(GeneralMealsAndProductsViewController.load())
    }
    
    static func load(with viewModel: DailyMealMainViewModelType?) -> DailyMealMainViewController {
        let viewController = DailyMealMainViewController(type: .DailyMeal)
        viewController.viewModel = viewModel
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
            return dailyMealCellSize
        } else {
            return categoryCellSize
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.dailyMealCollectionView {
            return (viewModel?.outputs.dailyMeals.count ?? 0) // just for testing purpose
        } else if collectionView == self.categoryCollectionView {
            return (viewModel?.outputs.categories?.count ?? 0)
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.dailyMealCollectionView {
            let cell: DailyMealCell = dailyMealCollectionView.dequeueReusableCell(for: indexPath)
            guard let item = viewModel?.outputs.dailyMeals[indexPath.row] else { return UICollectionViewCell() }
            cell.load(with: item)
            if (viewModel?.outputs.isCellSelected ?? false) && !item.isSelected {
                cell.addShadow()
            }
            let press = UILongPressGestureRecognizer(target: self, action: #selector(cellPressed(_:)))
            press.minimumPressDuration = 0.3
            cell.addGestureRecognizer(press)
            return cell
        } else {
            let cell: DailyMealCategoryCell = categoryCollectionView.dequeueReusableCell(for: indexPath)
            if let categoryName = viewModel?.outputs.categories?[indexPath.row] {
                cell.load(with: categoryName)
            }
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // show details of selected cell
    }
    
    @objc func cellPressed(_ sender: UILongPressGestureRecognizer? = nil) {
        if sender?.state == .ended {
            guard let p = sender?.location(in: self.dailyMealCollectionView) else { return }
            if let indexPath = self.dailyMealCollectionView.indexPathForItem(at: p) {
                dailyMealCollectionView.scrollToItem(at: indexPath, at: .left, animated: true)
                if let _ = self.dailyMealCollectionView.cellForItem(at: indexPath) {
                    changeDailyMealSelection(for: indexPath)
                }
            }
        }
    }
    
    private func changeDailyMealSelection(for index: IndexPath) {
        guard let viewModel = viewModel else { return }
        let shouldSelect = !viewModel.outputs.dailyMeals[index.row].isSelected
        viewModel.inputs.changeDailyMealSelection(with: shouldSelect ? index.row : nil)
        dailyMealCollectionView.isScrollEnabled = !shouldSelect
        categoryCollectionView.isScrollEnabled = !shouldSelect
        
        if shouldSelect {
            dailyMealCollectionView.backgroundColor = .black.withAlphaComponent(0.7)
            self.contentView.highlight(for: self.dailyMealCollectionView)
            showOptionsView()
        } else {
            // rmeove options View
            self.contentView.removeLayer(of: .highlighter)
            dailyMealCollectionView.backgroundColor = .white
        }
        dailyMealCollectionView.reloadData()
    }
    
    private func showOptionsView() {
        // add view that will contains options for cell
    }
}

// MARK: SetUp UI components
extension DailyMealMainViewController {
    private func loadGreetingTitleLabel() -> UILabel {
        let title = UILabel()
        title.numberOfLines = 1
        title.font = UIFont.aleo(type: .bold, size: 13)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.attributedText = NSAttributedString.customText(with: ["Hello".customString(with: .mainPurple),
                                                                    "Max charles".customString(with: .mainOrange)],
                                                             font: UIFont.aleo(type: .bold, size: 13))
        return title
    }
    
    private func loadSubTitleLabel() -> UILabel {
        let subTitle = UILabel()
        subTitle.numberOfLines = 0
        subTitle.font = UIFont.aleo(type: .bold, size: 13)
        subTitle.textColor = .darkBlue
        subTitle.translatesAutoresizingMaskIntoConstraints = false
        subTitle.text = "are you going to start cooking? you know someone have to cook and I guess you are the one who is willing to sucrifice"
        subTitle.addSpacing()
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
            categoryCollectionView.heightAnchor.constraint(equalToConstant: categoryCellSize.height + 10),
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
            dailyMealCollectionView.bottomAnchor.constraint(equalTo: categoryCollectionView.topAnchor,
                                                            constant: -10 * UIDevice.screenFactor)
        ])
        
        dailyMealCollectionView.reloadData()
        categoryCollectionView.reloadData()
    }
}
