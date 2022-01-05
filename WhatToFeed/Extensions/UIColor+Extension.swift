//
//  UIColor+Extension.swift
//  WhatToFeed
//
//  Created by Salome Sulkhanishvili on 05.01.22.
//

import Foundation
import UIKit

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int, alpha: CGFloat = 1.0) {
        self.init(red: CGFloat(red) / 255.0,
                  green: CGFloat(blue) / 255.0,
                  blue: CGFloat(blue) / 255.0,
                  alpha: alpha)
    }
    convenience init(hexValue: Int) {
        self.init(red: (hexValue >> 16 & 0xFF),
                  green: (hexValue >> 8 & 0xFF),
                  blue: (hexValue & 0xFF))
    }
}
