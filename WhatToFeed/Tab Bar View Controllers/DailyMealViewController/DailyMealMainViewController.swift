//
//  DailyMealViewController.swift
//  WhatToFeed
//
//  Created by Salome Sulkhanishvili on 05.01.22.
//

import UIKit

class DailyMealMainViewController: TabBarMainController {
    
    private lazy var dailyMealCollectionView: UICollectionView = {
        loadDailyMealCollectionView()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.loadEmptyView(in: self.contentView)
        DispatchQueue.main.async { [weak self] in
            self?.dailyMealCollectionView.reloadData()
        }
        // loadController(GeneralMealsAndProductsViewController.load())
    }
    
    static func load() -> DailyMealMainViewController {
        let viewController = DailyMealMainViewController(type: .DailyMeal)
        return viewController
    }
    
    private func loadDailyMealCollectionView() -> UICollectionView {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: 230, height: 400)
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        
        collectionView.registerCell(withType: DailyMealCell.self)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        collectionView.showsHorizontalScrollIndicator = false
        
        contentView.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            //TODO: should change top anchor
            collectionView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 91),
            collectionView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -76)
        ])
        return collectionView
    }
    
}

extension DailyMealMainViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5 // just for testing purpose
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell: DailyMealCell = dailyMealCollectionView.dequeueReusableCell(for: indexPath) {
            cell.load(with: "")
            return cell
        } else {
            fatalError("incorrect cell for DailyMealCell")
        }
        
    }
}


