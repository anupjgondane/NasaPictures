//
//  Factory.swift
//  NasaPictures
//
//  Created by Anup Gondane on 16/07/22.
//

import Foundation
import UIKit

/** Factory to create controller */
protocol ControllerFactory {
    static func getController(storyboard: UIStoryboard) -> ControllerFactory
}

extension ControllerFactory {
    static func getController(storyboard: UIStoryboard) -> ControllerFactory {
        return storyboard.instantiateViewController(withIdentifier: String(describing: self)) as! ControllerFactory
    }
}
