//
//  FavouriteCell.swift
//  NasaPictures
//
//  Created by Anup Gondane on 16/07/22.
//

import UIKit

/** Show picture, title and description with date */

protocol FavouriteCellDelegate: AnyObject {
    func favouriteAction(indexPath: IndexPath?)
}

class FavouriteCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var pictureImageView: UIImageView!
    @IBOutlet weak var bottomContainerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var favouriteContainerView: UIView!
    @IBOutlet weak var favouriteButton: UIButton!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    weak var delegate: FavouriteCellDelegate?
    var indexPath: IndexPath?
    
    static let cellIdentifier = "FavouriteCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupViewProperties()
    }
    
    func setupViewProperties() {
        self.selectionStyle = .none
        
        self.favouriteContainerView.layer.cornerRadius = self.favouriteContainerView.bounds.width / 2
        self.favouriteContainerView.layer.masksToBounds = true
        
        self.favouriteButton.setTitle("", for: .normal)
        
        self.containerView.roundCorner(radius: 10)
        self.favouriteContainerView.setWhiteTransparentColor()
        self.bottomContainerView.setWhiteTransparentColor(alpha: 0.5)
    }

    @IBAction func favouriteAction(_ sender: Any) {
        self.delegate?.favouriteAction(indexPath: indexPath)
    }
}
