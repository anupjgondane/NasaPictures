//
//  ApodRepository.swift
//  NasaApod
//
//  Created by Anup Gondane on 16/07/22.
//

import Foundation

protocol PictureRepositoryDelegate {
    associatedtype ResponseType
    associatedtype FavouriteType
    func fetchPicture(dateString: String, success: @escaping (PictureResponse?) -> Void, failure: @escaping (NetworkError?) -> Void)
    func fetchFavourites() -> [FavouriteType]
}

class PictureRepository: PictureRepositoryDelegate {
    
    static let shared = PictureRepository()
    
    private init() {}

    typealias ResponseType = PictureResponse
    typealias FavouriteType = PictureModel
    
    func fetchPicture(dateString: String, success: @escaping (PictureResponse?) -> Void, failure: @escaping (NetworkError?) -> Void) {
        var url = ApiConstant.picOfDayUrl
        if !dateString.isEmpty {
            url += "&date=\(dateString)"
        }
        NetworkManager().request(method: .get, urlString: url) { result in
            switch result {
                case .success(let data):
                do {
                    let response = try JSONDecoder().decode(PictureResponse.self, from: data)
                    if let code = response.code, (400...599).contains(code), let message = response.message, !message.isEmpty  {
                        failure(.apiError(message))
                    } else {
                        DatabaseManager.shared.savePicture(responseData: data)
                        success(response)
                    }
                } catch {
                    failure(.apiError(error.localizedDescription))
                }
                case .failure(let error):
                failure(error)
                case .none:
                break
            }
        }
    }
    
    func fetchFavourites() -> [PictureModel] {
        DatabaseManager.shared.fetchFavourites()
    }
}

extension PictureRepository {
    
    func fetchLastPictureFromDb() -> PictureResponse? {
        let lastPictureModel = DatabaseManager.shared.getLastPicture()
        let lastPictureModelData = lastPictureModel?.response?.data(using: .utf8)
        guard lastPictureModelData == nil else {
            return try? JSONDecoder().decode(PictureResponse.self, from: lastPictureModelData!)
        }
        return nil
    }
    
    func addFavourite(title: String?, explaination: String?, date: String?, mediaType: String?, url: String?) -> Bool {
        return DatabaseManager.shared.addFavourite(title: title, explaination: explaination, date: date, mediaType: mediaType, url: url)
    }
    
    func removeFavourite(byDate date: String) -> Bool {
        return DatabaseManager.shared.removeFavourite(byDate: date)
    }
    
    func isPictureFavourite(byDate date: String) -> Bool {
        return DatabaseManager.shared.isFavourite(byDate: date)
    }
}
