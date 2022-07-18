//
//  FavouritesViewController.swift
//  NasaPictures
//
//  Created by Anup Gondane on 16/07/22.
//

import UIKit

/** Favourite list screen - show list of favourites added */
class FavouritesViewController: UIViewController, ControllerFactory {

    @IBOutlet weak var tableView: UITableView!
    
    /** empty state view to show absence of data */
    lazy var emptyView: EmptyView? = {
        guard let view = EmptyView.instantiate() else {
            return nil
        }
        view.isHidden = true
        view.titleLabel.text = AppConstant.favouriteEmptyStateTitle
        self.view.addSubview(view)
        view.addFullViewConstraint()
        return view
    }()

    let viewModel = FavouriteViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerNibs()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.fetchFavourites()
        self.setupViewProperties()
        self.tableView.reloadData()
    }
        
    func setupViewProperties() {
        self.navigationItem.title = AppConstant.favourites
        self.setupEmptyStateView()
    }
    
    func setupEmptyStateView() {
        self.emptyView?.isHidden = !self.viewModel.pictures.isEmpty
    }

    func registerNibs() {
        self.tableView.register(UINib(nibName: FavouriteCell.cellIdentifier, bundle: .main), forCellReuseIdentifier: FavouriteCell.cellIdentifier)
    }
}

extension FavouritesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.pictures.count
    }
    
    fileprivate func configureFavouriteCell(_ cell: FavouriteCell, _ indexPath: IndexPath) {
        cell.delegate = self
        cell.indexPath = indexPath
        let pictureVM = self.viewModel.pictures[indexPath.row]
        cell.titleLabel.text = pictureVM.title
        cell.descriptionLabel.text = pictureVM.date
        cell.pictureImageView.downloadImage(imageUrl: pictureVM.url, placeholderImage: UIImage(systemName: ImageConstant.photo))
        cell.favouriteButton.setImage(UIImage(systemName: ImageConstant.heartFill), for: .normal)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FavouriteCell.cellIdentifier) as? FavouriteCell else {
            return UITableViewCell()
        }
        configureFavouriteCell(cell, indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.openDetails(at: indexPath)
    }
    
    /** open picture details */
    func openDetails(at indexPath: IndexPath) {
        let detailsController = FavouriteDetailsViewController.getController(storyboard: self.storyboard!) as! FavouriteDetailsViewController
        detailsController.viewModel = FavouriteDetailViewModel(pictureVM: self.viewModel.pictures[indexPath.row])
        detailsController.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(detailsController, animated: true)
    }
}

extension FavouritesViewController: FavouriteCellDelegate {
    // remove favourite
    func favouriteAction(indexPath: IndexPath?) {
        guard indexPath != nil else {
            return
        }
        let _ = self.showActionAlert(message: AppConstant.removeFavourite) { [weak self] in
            self?.viewModel.removeFavourites(at: indexPath!.row)
            DispatchQueue.main.async {
                self?.setupEmptyStateView()
                self?.tableView.reloadData()
            }
        } cancelAction: {
            
        }
    }
    
}
