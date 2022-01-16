//
//  String+Extension.swift
//  WhatToFeed
//
//  Created by Salome Sulkhanishvili on 16.01.22.
//

import Foundation
import UIKit

struct CustomString {
    var text: String = ""
    var color: UIColor = .black
}

extension String {
    func customString(with color: UIColor) -> CustomString {
        return CustomString(text: self,
                            color: color)
    }
}

