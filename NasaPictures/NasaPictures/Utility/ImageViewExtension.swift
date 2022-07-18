//
//  ImageViewExtension.swift
//  NasaPictures
//
//  Created by Anup Gondane on 16/07/22.
//

import Foundation
import UIKit
import SDWebImage

/** Download and set image */
extension UIImageView {
    func downloadImage(imageUrl: String, placeholderImage: UIImage?) {
        guard !imageUrl.isEmpty, let url = URL(string: imageUrl) else {
            DispatchQueue.main.async {
                if placeholderImage != nil {
                    self.image = placeholderImage
                }
            }
            return
        }
        self.sd_setImage(with: url, placeholderImage: placeholderImage, options: .retryFailed) { [weak self] image, error, _, _ in
            DispatchQueue.main.async {
                if image != nil {
                    self?.image = image
                } else if placeholderImage != nil {
                    self?.image = placeholderImage
                }
            }
        }
    }
}
