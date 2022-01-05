//
//  NSObject+Extension.swift
//  WhatToFeed
//
//  Created by Salome Sulkhanishvili on 05.01.22.
//

import Foundation

public extension NSObject {
    
    static var stringFromClass : String { return NSStringFromClass(self) }

    var stringFromClass : String { return NSStringFromClass(type(of: self)) }
    
    static var className : String { return self.stringFromClass.components(separatedBy: ".").last! }
    
    var className : String { return self.stringFromClass.components(separatedBy: ".").last! }
    
}
