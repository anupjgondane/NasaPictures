//
//  PictureViewModel.swift
//  NasaApod
//
//  Created by Anup Gondane on 16/07/22.
//

import Foundation

/** Modeal to populate data in Home screen */
struct PictureViewModel {
    private var picture: PictureResponse
    
    init(picture: PictureResponse) {
        self.picture = picture
    }
}

extension PictureViewModel {
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
    
    var mediaType: String {
        self.picture.mediaType ?? ""
    }
}
