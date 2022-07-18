//
//  ApiConstant.swift
//  NasaApod
//
//  Created by Anup Gondane on 16/07/22.
//

import Foundation

struct AppKeys {
    static let appKey = "eaQJV78iUj5T965R7IY2QKxWNlJhsy9farVcOrYd"
}

/** Api enpoints */
struct ApiConstant {
    static let picOfDayUrl = "https://api.nasa.gov/planetary/apod?api_key=\(AppKeys.appKey)"
}
