//
//  FavouriteDetailViewModel.swift
//  NasaPictures
//
//  Created by Anup Gondane on 18/07/22.
//

import Foundation

/** Model to populate data in favourite details */

struct FavouriteDetailViewModel {
    private var pictureVM: FavouritePictureViewModel
    
    var isFavouritePicture: Bool
    
    init(pictureVM: FavouritePictureViewModel) {
        self.pictureVM = pictureVM
        self.isFavouritePicture = true
    }
}

extension FavouriteDetailViewModel {
    var title: String {
        self.pictureVM.title
    }
    
    var description: String {
        self.pictureVM.description
    }
    
    var date: String {
        self.pictureVM.date
    }
    
    var responseDate: String {
        self.pictureVM.responseDate
    }
    
    var url: String {
        self.pictureVM.url
    }

}

extension FavouriteDetailViewModel {
    mutating func removeFavourite() -> Bool {
        let date = self.pictureVM.responseDate
        let isRemoved = PictureRepository.shared.removeFavourite(byDate: date)
        defer {
            self.isFavouritePicture = !isRemoved
        }
        return isRemoved
    }
}
