//
//  Response.swift
//  NasaApod
//
//  Created by Anup Gondane on 16/07/22.
//

import Foundation

/** Picture api response */
struct PictureResponse: Decodable {
    let date: String?
    let explaination: String?
    let mediaType: String?
    let title: String?
    let url: String?
    let code: Int?
    let message: String?

    enum CodingKeys: String, CodingKey {
    case date, title, url, code
    case explaination = "explanation"
    case mediaType = "media_type"
    case message = "msg"
    }
}
