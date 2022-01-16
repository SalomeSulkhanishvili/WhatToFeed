//
//  UILabel.swift
//  WhatToFeed
//
//  Created by Salome Sulkhanishvili on 16.01.22.
//

import Foundation
import UIKit

extension UILabel {
    func addSpacing(with spacing: CGFloat = 3) {
        var text: NSMutableAttributedString
        if let attributedText = self.attributedText {
            text = NSMutableAttributedString(attributedString: attributedText)
        } else {
            text = NSMutableAttributedString(string: self.text ?? "")
        }
        let paragraph = NSMutableParagraphStyle()
        paragraph.lineSpacing = spacing * UIDevice.screenFactor
        if textAlignment == .center {
            paragraph.alignment = .center
        }
        text.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraph, range: NSMakeRange(0, text.length))
        self.attributedText = text
    }
}
