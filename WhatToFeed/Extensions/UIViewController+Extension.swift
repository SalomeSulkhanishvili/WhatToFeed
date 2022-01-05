//
//  UIViewController+Extension.swift
//  WhatToFeed
//
//  Created by Salome Sulkhanishvili on 05.01.22.
//

import Foundation
import UIKit

extension UIViewController {
    static func _load<T>(with id: String, from storyboard: String, for bundle: Bundle? = nil) -> T? {
        return UIStoryboard(name: storyboard, bundle: bundle).instantiateInitialViewController() as? T
    }
    
    static func load(with id: String, from storyboard: String, for bundle: Bundle? = nil) -> Self?
    {
        return self._load(with: id, from: storyboard, for: bundle)
    }
    
    //TODO: remove viewContorell from storyboards name
    static func load(for bundle: Bundle? = nil) -> Self? {
        return self._load(with: self.className, from: self.className, for: bundle)
    }
}
