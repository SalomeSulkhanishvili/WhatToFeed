//
//  NSAttributedString+Extension.swift
//  WhatToFeed
//
//  Created by Salome Sulkhanishvili on 16.01.22.
//

import Foundation

extension NSAttributedString {
    
    static func customText(with strings: [CustomString]?, font: UIFont = UIFont.aleo(type: .regular, size: 14)) -> NSAttributedString {
        guard let elements = strings else { return NSAttributedString() as! Self}
        let content = NSMutableAttributedString()
        elements.forEach({ element in
            let tempString = NSAttributedString(string: element.text + " ", attributes: [
                .foregroundColor: element.color,
                .font: font
            ])
            content.append(tempString)
        })
        return content
    }
}
