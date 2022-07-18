//
//  FavouriteViewModel.swift
//  NasaPictures
//
//  Created by Anup Gondane on 16/07/22.
//

import Foundation

/** Model to populate data in favourite list */

class FavouriteViewModel {
    var pictures: [FavouritePictureViewModel] = []
}

extension FavouriteViewModel {
    func fetchFavourites() {
        self.pictures = PictureRepository.shared.fetchFavourites().map { FavouritePictureViewModel(picture: $0)}
    }
    
    func removeFavourites(at index: Int) {
        let picture = self.pictures[index]
        self.pictures.remove(at: index)
        let _ = PictureRepository.shared.removeFavourite(byDate: picture.responseDate)
    }
}
