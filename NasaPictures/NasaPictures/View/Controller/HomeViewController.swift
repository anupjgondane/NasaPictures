//
//  HomeViewController.swift
//  NasaPictures
//
//  Created by Anup Gondane on 16/07/22.
//

import UIKit

/** Home screen - search austronomy picture of a day */
class HomeViewController: UIViewController, ControllerFactory {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    /** Show empty state in absence of data */
    lazy var emptyView: EmptyView? = {
        guard let view = EmptyView.instantiate() else {
            return nil
        }
        view.isHidden = true
        view.titleLabel.text = AppConstant.homeViewEmptyStateTitle
        self.tableView.addSubview(view)
        return view
    }()
    
    lazy var loadingIndicatorView: LoadingView? = {
        guard let view = LoadingView.instantiate() else {
            return nil
        }
        view.isHidden = true
        self.tableView.addSubview(view)
        return view
    }()
    
    let viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addCalendarButton()
        self.registerNibs()
        self.setDate()
    }
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.fetchPicture()
    }
    
    func addCalendarButton() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: ImageConstant.calendar), style: .plain, target: self, action: #selector(openDatePicker))
    }

    func registerNibs() {
        self.tableView.register(UINib(nibName: PictureCell.cellIdentifier, bundle: .main), forCellReuseIdentifier: PictureCell.cellIdentifier)
    }
    
    func setDate() {
        self.navigationItem.title = AppConstant.astronomyPicOfTheDay + (self.viewModel.toDate ?? Date()).toString(format: AppConstant.displayDateFormat)
    }

    // Selector
    @objc func openDatePicker() {
        guard let datePickerController = DatePickerViewController.getController(storyboard: self.storyboard!) as? DatePickerViewController else {
            return
        }
        datePickerController.delegate = self
        datePickerController.selectedDate = self.viewModel.toDate
        datePickerController.modalPresentationStyle = .overFullScreen
        self.present(datePickerController, animated: true, completion: nil)
    }

}

extension HomeViewController {
    /** search picture */
    func fetchPicture() {
        self.showLoading(title: AppConstant.loading)
        self.viewModel.fetchPicture { [weak self] status, error in
            DispatchQueue.main.async {
                self?.stopLoading()
                if status {
                    self?.emptyView?.isHidden = true
                    self?.tableView.reloadData()
                } else {
                    self?.emptyView?.isHidden = false
                    let _ = self?.showAlert(message: error?.message() ?? AppConstant.invalidResponse)
                }
            }
        }
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.pictureVM != nil ? 1 : 0
    }
    
    fileprivate func configurePictureCell(_ cell: PictureCell) {
        cell.delegate = self
        cell.titleLabel.text = self.viewModel.pictureVM?.title ?? ""
        cell.descriptionLabel.text = self.viewModel.pictureVM?.description ?? ""
        cell.dateLabel.text = self.viewModel.pictureVM?.date ?? ""
        cell.pictureView.downloadImage(imageUrl: self.viewModel.pictureVM?.url ?? "", placeholderImage: UIImage(systemName: ImageConstant.photo))
        let favouriteImage = self.viewModel.isFavouritePicture ? UIImage(systemName: ImageConstant.heartFill) : UIImage(systemName: ImageConstant.heart)
        cell.favouriteButton.setImage(favouriteImage, for: .normal)
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

extension HomeViewController: PictureCellDelegate {
    // add and remove favourite
    func favouriteAction() {
        var status: Bool = false
        if self.viewModel.isFavouritePicture {
            let _ = self.showActionAlert(message: AppConstant.removeFavourite) { [weak self] in
                status = self?.viewModel.removeFavourite() ?? false
                if status {
                    DispatchQueue.main.async {
                        self?.tableView.reloadData()
                    }
                }
            } cancelAction: {
                
            }

        } else {
            status = self.viewModel.addFavourite()
            if status {
                self.tableView.reloadData()
            }
        }
    }
}

extension HomeViewController: LoadingDelegate {
    // display loader
    func loadingView() -> LoadingView? {
        return self.loadingIndicatorView
    }
}

extension HomeViewController: DatePickerViewControllerDelegate {
    func didSelectDate(date: Date) {
        self.viewModel.toDate = date
        self.viewModel.refresh = true
        self.setDate()
        self.fetchPicture()
    }
}
