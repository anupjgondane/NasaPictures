//
//  DateExtension.swift
//  NasaPictures
//
//  Created by Anup Gondane on 16/07/22.
//

import Foundation

/** convert date to string */
extension Date {
    func toString(format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}
