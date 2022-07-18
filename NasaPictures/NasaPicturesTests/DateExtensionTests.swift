//
//  DateExtensionTests.swift
//  NasaPicturesTests
//
//  Created by Anup Gondane on 18/07/22.
//

import XCTest
@testable import NasaPictures

class DateExtensionTests: XCTestCase {

    func testToStringSuccess() {
        let dateString = "2022-07-16"
        let date = dateString.toDate(format: "yyyy-MM-dd")
        XCTAssertNotNil(date)
    }
    
    func testToStringFailure() {
        let dateString = "07-16-2022"
        let date = dateString.toDate(format: "yyyy-MM-dd")
        XCTAssertNil(date)
    }
}
