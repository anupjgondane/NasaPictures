//
//  StringExtension.swift
//  NasaPictures
//
//  Created by Anup Gondane on 16/07/22.
//

import Foundation

/** convert string to date */
extension String {
    func toDate(format: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.date(from: self)
    }
}
