//
//  UIView+Extension.swift
//  WhatToFeed
//
//  Created by Salome Sulkhanishvili on 06.01.22.
//

import Foundation
import UIKit

// MARK: - load UIView
extension UIView {
    static func _load<T>(with name: String, for owner: Any? = UIView.self, options: [UINib.OptionsKey : Any]? = nil) -> T {
        guard let view = Bundle.main.loadNibNamed(name, owner: owner, options: options)?.first as? T else {
            fatalError("Nib can not be loaded with given parameters")
        }
        return view
    }
    
    static func load(with name: String, for owner: Any? = nil, options: [UINib.OptionsKey : Any]? = nil) -> Self {
        return self._load(with: name, for: owner, options: options)
    }
    
    static func loadFromNib(for owner: Any? = nil, options: [UINib.OptionsKey : Any]? = nil) -> Self {
        return self._load(with: self.className, for: owner, options: options)
    }
}

// MARK: - Safe Area Anchors extension
extension UIView {

  var safeTopAnchor: NSLayoutYAxisAnchor {
    if #available(iOS 11.0, *) {
      return safeAreaLayoutGuide.topAnchor
    }
    return topAnchor
  }

  var safeLeandingAnchor: NSLayoutXAxisAnchor {
    if #available(iOS 11.0, *){
      return safeAreaLayoutGuide.leadingAnchor
    }
    return leadingAnchor
  }

  var safeTrailingAnchor: NSLayoutXAxisAnchor {
    if #available(iOS 11.0, *){
      return safeAreaLayoutGuide.trailingAnchor
    }
    return trailingAnchor
  }

  var safeBottomAnchor: NSLayoutYAxisAnchor {
    if #available(iOS 11.0, *) {
      return safeAreaLayoutGuide.bottomAnchor
    }
    return bottomAnchor
  }
}

// MARK: - Gradient layer extension
extension UIView {
    func LinearbackgroundColor(with colors: [UIColor]){
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colors.map { $0.cgColor }
        self.layer.insertSublayer(gradient, at: 0)
    }
}

// MARK: - shadows
extension UIView {
    enum LayersName: String {
        case shadow = "shadow"
        case highlighter = "highlighter"
        
    }
    func removeLayer(of type: LayersName) {
        guard let layers = self.layer.sublayers else { return }
        for layer in layers {
            if let name = layer.name, name == type.rawValue {
                layer.removeFromSuperlayer()
            }
        }
    }
    
    func addShadow(of color: UIColor, radius: CGFloat, offset: CGSize = .zero, opacity: Float = 1) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = color.cgColor
        self.layer.shadowRadius = radius
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = offset
        self.layer.name = LayersName.shadow.rawValue
    }
}

extension UIView {
    func highlight(for view: UIView, isVisible: Bool) {
        if isVisible {
            self.highlight(for: view, color: .backgroundForHighlight)
        } else {
            self.removeLayer(of: .highlighter)
        }
    }
    
    func highlight(for view: UIView, color: UIColor = .black) {
        self.highlight(x: view.frame.origin.x,
                       y: view.frame.origin.y,
                       width: view.bounds.width,
                       height: view.bounds.height,
                       radius: view.layer.cornerRadius,
                       color: color)
    }
    
    func highlight(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat, radius: CGFloat, color: UIColor) {
        self.removeLayer(of: .highlighter)
        let path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height), cornerRadius: 0)
        let circlePath = UIBezierPath(roundedRect: CGRect(x: x,
                                                          y: y,
                                                          width: width,
                                                          height: height),
                                      cornerRadius: radius)
        path.append(circlePath)
        path.usesEvenOddFillRule = true

        let fillLayer = CAShapeLayer()
        fillLayer.path = path.cgPath
        fillLayer.fillRule = .evenOdd
        fillLayer.fillColor = color.cgColor// view.backgroundColor?.cgColor
        fillLayer.name = LayersName.highlighter.rawValue
        layer.addSublayer(fillLayer)
    }
}

