//
//  NibExtension.swift
//  NasaApod
//
//  Created by Anup Gondane on 16/07/22.
//

import Foundation
import UIKit

protocol NibInstiatiable {
    static var nibName: String { get }
    static func instantiate() -> Self?
    static func instantiate(nibName: String, owner: AnyObject?) -> Self?
}

/** Load xibs as per the file name specified */
extension NibInstiatiable {
    static var nibName: String {
        String(describing: self)
    }
    
    static func instantiate() -> Self? {
        instantiate(nibName: nibName, owner: nil)
    }
    
    static func instantiate(nibName: String, owner: AnyObject?) -> Self? {
        let nib = UINib(nibName: nibName, bundle: .main)
        return nib.instantiate(withOwner: owner, options: nil).first as? Self
    }
}
