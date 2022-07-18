//
//  NetworkManaager.swift
//  NasaApod
//
//  Created by Anup Gondane on 16/07/22.
//

import Foundation

/** Network operations */
enum NetworkError: Error {
    case invalidUrl
    case invalidResponse
    case parseError
    case apiError(String)
    case networkError
    
    func message() -> String {
        switch self {
        case .invalidUrl:
            return AppConstant.invalidUrl
        case .apiError(let message):
            return message
        case .networkError:
            return AppConstant.internetNotAvailable
        default:
            return AppConstant.invalidResponse
        }
    }
}

enum HttpMethod: String {
    case get = "GET"
}

protocol NetworkManagerDelegate {
    func request(method: HttpMethod, urlString: String, completion: @escaping  (Result<Data, NetworkError>?) -> Void)
}

class NetworkManager: NetworkManagerDelegate {
            
    /** Request network operation */
    func request(method: HttpMethod, urlString: String, completion: @escaping  (Result<Data, NetworkError>?) -> Void) {
        guard NetworkReachability.shared.isNetworkReachable() else {
            completion(.failure(.networkError))
            return
        }
        guard !urlString.isEmpty, let url = URL(string: urlString) else {
            completion(.failure(.invalidUrl))
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else {
                completion(.failure(.apiError(error!.localizedDescription)))
                return
            }
            guard let responseData = data else {
                completion(.failure(.invalidResponse))
                return
            }
            completion(.success(responseData))
        }.resume()
    }
}
