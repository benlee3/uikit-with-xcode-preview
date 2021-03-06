//
//  UIView+Anchor.swift
//  uikit-preview-test
//
//  Created by Ben Lee on 11/17/21.
//
// from: https://gist.github.com/joeygordon/661528411ba0bdae57bf0f69965828ad

import UIKit

extension UIView {
    
    func anchor(top: NSLayoutYAxisAnchor? = nil,
                left: NSLayoutXAxisAnchor? = nil,
                bottom: NSLayoutYAxisAnchor? = nil,
                right: NSLayoutXAxisAnchor? = nil,
                topConstant: CGFloat = 0,
                leftConstant: CGFloat = 0,
                bottomConstant: CGFloat = 0,
                rightConstant: CGFloat = 0,
                widthConstant: CGFloat = 0,
                heightConstant: CGFloat = 0,
                centerXanchor: NSLayoutXAxisAnchor? = nil,
                centerYanchor: NSLayoutYAxisAnchor? = nil) {
        translatesAutoresizingMaskIntoConstraints = false
        
        var anchors = [NSLayoutConstraint]()
        
        if let top = top {
            anchors.append(topAnchor.constraint(equalTo: top, constant: topConstant))
        }
        
        if let left = left {
            anchors.append(leftAnchor.constraint(equalTo: left, constant: leftConstant))
        }
        
        if let bottom = bottom {
            anchors.append(bottomAnchor.constraint(equalTo: bottom, constant: -bottomConstant))
        }
        
        if let right = right {
            anchors.append(rightAnchor.constraint(equalTo: right, constant: -rightConstant))
        }
        
        if widthConstant > 0 {
            anchors.append(widthAnchor.constraint(equalToConstant: widthConstant))
        }
        
        if heightConstant > 0 {
            anchors.append(heightAnchor.constraint(equalToConstant: heightConstant))
        }
        
        if let centerXanchor = centerXanchor {
            anchors.append(centerXAnchor.constraint(equalTo: centerXanchor))
        }
        
        if let centerYanchor = centerYanchor {
            anchors.append(centerYAnchor.constraint(equalTo: centerYanchor))
        }
        
        NSLayoutConstraint.activate(anchors)
    }
    
}
