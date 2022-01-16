//
//  UIFont+Extension.swift
//  WhatToFeed
//
//  Created by Salome Sulkhanishvili on 16.01.22.
//

import Foundation
import UIKit

extension UIFont {
    enum Aleo: String {
        case bold = "Aleo-Bold"
        case boldItalic = "Aleo-BoldItalic"
        case italic = "Aleo-Italic"
        case light = "Aleo-Light"
        case lightItalic = "Aleo-LightItalic"
        case regular = "Aleo-Regular"
    }
    
    static func aleo(type: Aleo = .regular, size: CGFloat = 12) -> UIFont {
        return UIFont(name: type.rawValue, size: size * UIDevice.screenFactor)!
    }
}
