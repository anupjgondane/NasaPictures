//
//  DatabaseManager.swift
//  NasaApod
//
//  Created by Anup Gondane on 16/07/22.
//

import UIKit

/** database operations - save, remove picture, add and remove favourite */
protocol DatabaseManagerDelegate {
    func savePicture(responseData: Data)
    func getLastPicture() -> LastPictureModel?
    func addFavourite(title: String?, explaination: String?, date: String?, mediaType: String?, url: String?) -> Bool
    func removeFavourite(byDate date: String) -> Bool
    func isFavourite(byDate date: String) -> Bool
}


class DatabaseManager {
    static let shared = DatabaseManager()
    
    private init() {}
    
    private func removeLastPictures() {
        if let pictures = try? PersistantStorage.shared.getContext().fetch(LastPictureModel.fetchRequest()) {
            for lastPicture in pictures {
                PersistantStorage.shared.getContext().delete(lastPicture)
                PersistantStorage.shared.save()
            }
        }
    }
}

extension DatabaseManager: DatabaseManagerDelegate {
    /** Save latest picture and delete old ones*/
    func savePicture(responseData: Data) {
        self.removeLastPictures()
        let responseString = String(data: responseData, encoding: .utf8)
        let lastPictureModel = LastPictureModel(context: PersistantStorage.shared.getContext())
        lastPictureModel.response = responseString
        PersistantStorage.shared.save()
    }
    
    func getLastPicture() -> LastPictureModel? {
        return try? PersistantStorage.shared.getContext().fetch(LastPictureModel.fetchRequest()).first
    }
    
    /** add picture to favourite */
    func addFavourite(title: String?, explaination: String?, date: String?, mediaType: String?, url: String?) -> Bool {
        let pictureModel = PictureModel(context: PersistantStorage.shared.getContext())
        pictureModel.title = title
        pictureModel.explaination = explaination
        pictureModel.date = date
        pictureModel.mediaType = mediaType
        pictureModel.url = url
        PersistantStorage.shared.save()
        return true
    }
    
    /** remov picture from favourite */
    func removeFavourite(byDate date: String) -> Bool {
        let fetchRequest = PictureModel.fetchRequest(byDate: date)
        if let pictureModel = try? PersistantStorage.shared.getContext().fetch(fetchRequest).first {
            PersistantStorage.shared.getContext().delete(pictureModel)
            PersistantStorage.shared.save()
            return true
        }
        return false
    }
    
    func isFavourite(byDate date: String) -> Bool {
        let fetchRequest = PictureModel.fetchRequest(byDate: date)
        guard let pictures = try? PersistantStorage.shared.getContext().fetch(fetchRequest) else {
            return false
        }
        return !pictures.isEmpty
    }
    
    func fetchFavourites() -> [PictureModel] {
        guard let pictures = try? PersistantStorage.shared.getContext().fetch(PictureModel.fetchRequest()) else {
            return []
        }
        return pictures
    }
}
