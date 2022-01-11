//
//  Int+Extension.swift
//  WhatToFeed
//
//  Created by Salome Sulkhanishvili on 12.01.22.
//

import Foundation
import UIKit

extension Int {
    var screenFactor: CGFloat {
        return CGFloat(self) * UIDevice.screenFactor
    }
}
