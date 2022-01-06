//
//  UIImage+Extension.swift
//  WhatToFeed
//
//  Created by Salome Sulkhanishvili on 06.01.22.
//

import Foundation
import UIKit

extension UIImage {
    static func load(name: String) -> UIImage {
        return UIImage(named: name) ?? UIImage(named: "no_image")!
    }
}
