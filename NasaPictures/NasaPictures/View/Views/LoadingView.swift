//
//  LoadingView.swift
//  NasaPictures
//
//  Created by Anup Gondane on 16/07/22.
//

import UIKit

/** Loader view for high lifting operations */
protocol LoadingDelegate {
    func loadingView() -> LoadingView?
    func showLoading(title: String)
    func stopLoading()
}

extension LoadingDelegate {
    
    func showLoading(title: String) {
        self.loadingView()?.start(title: title)
        self.loadingView()?.isHidden = false
    }
    
    func stopLoading() {
        self.loadingView()?.isHidden = true
    }
    
}

class LoadingView: UIView {

    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    @IBOutlet weak var titleLabel: UILabel!

}

extension LoadingView: NibInstiatiable {}

extension LoadingView {
    func start() {
        self.activityIndicatorView.startAnimating()
    }
    
    func start(title: String) {
        self.titleLabel.text = title
        self.start()
    }
    
    func stop() {
        self.activityIndicatorView.stopAnimating()
    }
}
