//
//  ViewControllerExtension.swift
//  NasaPictures
//
//  Created by Anup Gondane on 16/07/22.
//

import Foundation
import UIKit

/** show alert, error */
extension UIViewController {
    func showAlert(message: String) -> Bool {
        guard !message.isEmpty else {
            return false
        }
        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: AppConstant.ok, style: .default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
        return true
    }
    
    func showActionAlert(message: String, okAction: @escaping () -> Void, cancelAction: @escaping () -> Void) -> Bool {
        guard !message.isEmpty else {
            return false
        }
        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: AppConstant.ok, style: .default, handler: { _ in
           okAction()
        }))
        alertController.addAction(UIAlertAction(title: AppConstant.cancel, style: .default, handler: { _ in
            cancelAction()
        }))
        self.present(alertController, animated: true, completion: nil)
        return true
    }
}

