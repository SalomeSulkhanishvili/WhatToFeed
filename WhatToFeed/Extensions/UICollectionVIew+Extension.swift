//
//  UICollectionVIew+Extension.swift
//  WhatToFeed
//
//  Created by Salome Sulkhanishvili on 09.01.22.
//

import Foundation
import UIKit

extension UICollectionView {
    func registerCell<T: UICollectionViewCell>(withType: T.Type) {
        let cell = UINib(nibName: T.className, bundle: nil)
        self.register(cell, forCellWithReuseIdentifier: T.className)
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T? {
        return self.dequeueReusableCell(withReuseIdentifier: T.className, for: indexPath) as? T
    }
}
