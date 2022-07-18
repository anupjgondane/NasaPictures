//
//  ViewExtension.swift
//  NasaApod
//
//  Created by Anup Gondane on 16/07/22.
//

import Foundation
import UIKit

extension UIView {
    
    /** Adding Autolayout constraint programmatically  */
    
    func enableConstraint() {
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func topMargin(constant: CGFloat) {
        let constraint = NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: self.superview, attribute: .top, multiplier: 1, constant: constant)
        constraint.isActive = true
        self.superview?.addConstraint(constraint)
    }
    
    func bottomMargin(constant: CGFloat) {
        let constraint = NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: self.superview, attribute: .bottom, multiplier: 1, constant: constant)
        constraint.isActive = true
        self.superview?.addConstraint(constraint)
    }
    
    func leadingMargin(constant: CGFloat) {
        let constraint = NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: self.superview, attribute: .leading, multiplier: 1, constant: constant)
        constraint.isActive = true
        self.superview?.addConstraint(constraint)
    }
    
    func trailingMargin(constant: CGFloat) {
        let constraint = NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: self.superview, attribute: .trailing, multiplier: 1, constant: constant)
        constraint.isActive = true
        self.superview?.addConstraint(constraint)
    }
    
    func addFullViewConstraint() {
        self.enableConstraint()
        self.topMargin(constant: 0)
        self.bottomMargin(constant: 0)
        self.leadingMargin(constant: 0)
        self.trailingMargin(constant: 0)
    }
}

extension UIView {
    /** black transaparent color */
    func setBlackTransparentColor(alpha: CGFloat = 0.5) {
        self.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: alpha)
    }
    
    /** white transaparent color */
    func setWhiteTransparentColor(alpha: CGFloat = 0.2) {
        self.backgroundColor = UIColor(white: 1, alpha: alpha)
    }

    /** round corners */
    func roundCorner(radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
}
