//
//  NSLayoutContraints.swift
//  WhatToFeed
//
//  Created by Salome Sulkhanishvili on 16.01.22.
//

import Foundation
import UIKit

extension NSLayoutConstraint {
    @IBInspectable public var shouldAdjustConstantToFitDevice : Bool {
        get { return false }
        set { if(newValue) { self.constant *= UIDevice.screenFactor } } }
}


extension UIButton {
    
    @IBInspectable public var adjustContentEdgeInsetsToFitDevice : Bool {
        get { return false }
        set {
            self.contentEdgeInsets.top *= UIDevice.screenFactor
            self.contentEdgeInsets.left *= UIDevice.screenFactor
            self.contentEdgeInsets.bottom *= UIDevice.screenFactor
            self.contentEdgeInsets.right *= UIDevice.screenFactor
        }
    }
    
    @IBInspectable public var adjustImageEdgeInsetsToFitDevice : Bool {
        get { return false }
        set {
            self.imageEdgeInsets.top *= UIDevice.screenFactor
            self.imageEdgeInsets.left *= UIDevice.screenFactor
            self.imageEdgeInsets.bottom *= UIDevice.screenFactor
            self.imageEdgeInsets.right *= UIDevice.screenFactor
        }
    }
    
    @IBInspectable public var adjustTitleEdgeInsetsToFitDevice : Bool {
        get { return false }
        set {
            self.titleEdgeInsets.top *= UIDevice.screenFactor
            self.titleEdgeInsets.left *= UIDevice.screenFactor
            self.titleEdgeInsets.bottom *= UIDevice.screenFactor
            self.titleEdgeInsets.right *= UIDevice.screenFactor
        }
    }
    
    @IBInspectable public var shouldAdjustFontSizeToFitDevice : Bool {
        get { return false }
        set { if(newValue) { self.adjustsFontSizeToFitDevice() } } }
    
    public func adjustsFontSizeToFitDevice() {
        self.titleLabel?.adjustsFontSizeToFitDevice()
    }
    
}

extension UITextField {
    
    @IBInspectable public var shouldAdjustFontSizeToFitDevice : Bool {
        get { return false }
        set { if(newValue) { self.adjustsFontSizeToFitDevice() } } }
    
    public func adjustsFontSizeToFitDevice() {
        if let f = self.font {
            self.font = UIFont(name: f.fontName, size: f.pointSize * UIDevice.screenFactor)
        }
    }
    
}

extension UILabel {
    @IBInspectable public var shouldAdjustFontSizeToFitDevice : Bool { get { return false } set { if(newValue) { self.adjustsFontSizeToFitDevice() } } }
    
    public func adjustsFontSizeToFitDevice() {
        if let f = self.font {
            self.font = UIFont(name: f.fontName, size: f.pointSize * UIDevice.screenFactor)
        }
    }
}
