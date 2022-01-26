//
//  UITableView+Extension.swift
//  WhatToFeed
//
//  Created by Salome Sulkhanishvili on 26.01.22.
//

import Foundation
import UIKit

extension UITableView {
    func registerCell<T: UITableViewCell>(withType: T.Type) {
        let cell = UINib(nibName: T.className, bundle: nil)
        self.register(cell, forCellReuseIdentifier: T.className)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        if let cell = self.dequeueReusableCell(withIdentifier: T.className, for: indexPath) as? T {
            return cell
        } else {
            fatalError("incorrect cell for \(T.className)")
        }
    }
}
