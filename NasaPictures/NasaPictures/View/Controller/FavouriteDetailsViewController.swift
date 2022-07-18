//
//  FavouriteDetailsViewController.swift
//  NasaPictures
//
//  Created by Anup Gondane on 18/07/22.
//

import UIKit

/** Favourite details screen - details of picture */
class FavouriteDetailsViewController: UIViewController, ControllerFactory {

    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: FavouriteDetailViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerNibs()
    }

    func registerNibs() {
        self.tableView.register(UINib(nibName: PictureCell.cellIdentifier, bundle: .main), forCellReuseIdentifier: PictureCell.cellIdentifier)
    }

}

extension FavouriteDetailsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    fileprivate func configurePictureCell(_ cell: PictureCell) {
        cell.delegate = self
        cell.titleLabel.text = self.viewModel?.title ?? ""
        cell.descriptionLabel.text = self.viewModel?.description ?? ""
        cell.dateLabel.text = self.viewModel?.date ?? ""
        cell.pictureView.downloadImage(imageUrl: self.viewModel?.url ?? "", placeholderImage: UIImage(systemName: ImageConstant.photo))
        let isFavourite = self.viewModel?.isFavouritePicture ?? false
        cell.favouriteButton.setImage(isFavourite ? UIImage(systemName: ImageConstant.heartFill) : UIImage(systemName: ImageConstant.heart), for: .normal)
        cell.updateConstraints()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PictureCell.cellIdentifier) as? PictureCell else {
            return UITableViewCell()
        }
        configurePictureCell(cell)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

}

extension FavouriteDetailsViewController: PictureCellDelegate {
    // remove favourite
    func favouriteAction() {
        let _ = self.showActionAlert(message: AppConstant.removeFavourite) { [weak self] in
            let _ = self?.viewModel?.removeFavourite()
            self?.navigationController?.popViewController(animated: true)
        } cancelAction: {
            
        }
    }
}
