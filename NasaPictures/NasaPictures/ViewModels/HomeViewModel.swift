//
//  HomeViewModel.swift
//  NasaApod
//
//  Created by Anup Gondane on 16/07/22.
//

import UIKit
import Reachability

class HomeViewModel {
    var pictureVM: PictureViewModel? = nil
    var isFavouritePicture = false
    var toDate: Date? = nil
    var refresh = false
}

extension HomeViewModel {
    fileprivate func saveFetchedPicture(_ response: PictureResponse) {
        self.pictureVM = PictureViewModel(picture: response)
        if let date = response.date {
            self.isFavouritePicture = PictureRepository.shared.isPictureFavourite(byDate: date)
        }
    }
    /** Fetch last searched picture from database and fetch new picture from api */
    func fetchPicture(completion: @escaping (Bool, NetworkError?) -> Void) {
        if !refresh {
            if let response = PictureRepository.shared.fetchLastPictureFromDb() {
                saveFetchedPicture(response)
                completion(true, nil)
            }
        }
        PictureRepository.shared.fetchPicture(dateString: self.toDateString()) { [weak self] response in
            if response != nil {
                self?.saveFetchedPicture(response!)
                completion(true, nil)
            } else {
                completion(false, .invalidResponse)
            }
        } failure: { error in
            completion(false, error)
        }
    }
    
    /** add favourite */
    func addFavourite() -> Bool {
        let isAdded = PictureRepository.shared.addFavourite(title: self.pictureVM?.title, explaination: self.pictureVM?.description, date: self.pictureVM?.responseDate, mediaType: self.pictureVM?.mediaType, url: self.pictureVM?.url)
        defer {
            self.isFavouritePicture = true
        }
        return isAdded
    }
    
    /** remove favourite */
    func removeFavourite() -> Bool {
        if let date = self.pictureVM?.responseDate {
            let isRemoved = PictureRepository.shared.removeFavourite(byDate: date)
            defer {
                self.isFavouritePicture = !isRemoved
            }
            return isRemoved
        }
        return false
    }
    
    func toDateString() -> String {
        guard toDate != nil else {
            return ""
        }
        return toDate!.toString(format: AppConstant.responseDateFormat)
    }
}
