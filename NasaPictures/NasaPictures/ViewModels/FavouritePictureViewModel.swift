//
//  FavouritePictureViewModel.swift
//  NasaPictures
//
//  Created by Anup Gondane on 16/07/22.
//

import Foundation

/** Model to populate data in favourite */
struct FavouritePictureViewModel {
    private let picture: PictureModel
    init(picture: PictureModel) {
        self.picture = picture
    }
}

extension FavouritePictureViewModel {    
    var title: String {
        self.picture.title ?? ""
    }
    
    var description: String {
        self.picture.explaination ?? ""
    }
    
    var date: String {
        if let date = (self.picture.date ?? "").toDate(format: AppConstant.responseDateFormat) {
            return date.toString(format: AppConstant.displayDateFormat)
        }
        return self.picture.date ?? ""
    }
    
    var responseDate: String {
        self.picture.date ?? ""
    }
    
    var url: String {
        self.picture.url ?? ""
    }
}
