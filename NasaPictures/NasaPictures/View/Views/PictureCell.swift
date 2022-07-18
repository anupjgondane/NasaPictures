//
//  PictureCell.swift
//  NasaPictures
//
//  Created by Anup Gondane on 16/07/22.
//

import UIKit

protocol PictureCellDelegate: AnyObject {
    func favouriteAction()
}

/** Show picture, title and description with date */
class PictureCell: UITableViewCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var pictureView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var favouriteButton: UIButton!
    @IBOutlet weak var imageRatio: NSLayoutConstraint!
    
    weak var delegate: PictureCellDelegate?
    
    static let cellIdentifier = "PictureCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupViewProperties()
    }
    
    func setupViewProperties() {
        self.selectionStyle = .none
        self.favouriteButton.setTitle("", for: .normal)
    }

    @IBAction func favouriteButtonAction(_ sender: Any) {
        self.delegate?.favouriteAction()
    }
}
