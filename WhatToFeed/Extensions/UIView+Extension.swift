//
//  UIView+Extension.swift
//  WhatToFeed
//
//  Created by Salome Sulkhanishvili on 06.01.22.
//

import Foundation
import UIKit

extension UIView {
    static func _load<T>(with name: String, for owner: Any? = self, options: [UINib.OptionsKey : Any]? = nil) -> T {
        guard let view = Bundle.main.loadNibNamed(name, owner: owner, options: options)?.first as? T else {
            fatalError("Nib can not be loaded with given parameters")
        }
        return view
    }
    
    static func load(with name: String, for owner: Any? = nil, options: [UINib.OptionsKey : Any]? = nil) -> Self {
        return self._load(with: name, for: owner, options: options)
    }
    
    static func loadFromNib(for owner: Any? = nil, options: [UINib.OptionsKey : Any]? = nil) -> Self {
        return self._load(with: self.className, for: owner, options: options)
    }
}

extension UIView {

  var safeTopAnchor: NSLayoutYAxisAnchor {
    if #available(iOS 11.0, *) {
      return safeAreaLayoutGuide.topAnchor
    }
    return topAnchor
  }

  var safeLeftAnchor: NSLayoutXAxisAnchor {
    if #available(iOS 11.0, *){
      return safeAreaLayoutGuide.leftAnchor
    }
    return leftAnchor
  }

  var safeRightAnchor: NSLayoutXAxisAnchor {
    if #available(iOS 11.0, *){
      return safeAreaLayoutGuide.rightAnchor
    }
    return rightAnchor
  }

  var safeBottomAnchor: NSLayoutYAxisAnchor {
    if #available(iOS 11.0, *) {
      return safeAreaLayoutGuide.bottomAnchor
    }
    return bottomAnchor
  }
}
