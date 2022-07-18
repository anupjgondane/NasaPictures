//
//  StringExtensionTests.swift
//  NasaPicturesTests
//
//  Created by Anup Gondane on 18/07/22.
//

import XCTest
@testable import NasaPictures

class StringExtensionTests: XCTestCase {

    func testToDateStringSuccess() {
        let dateString = "2022-07-10"
        let date = dateString.toDate(format: "yyyy-MM-dd")
        XCTAssertNotNil(date)
    }
    
    func testToDateStringFailure() {
        let dateString = "2022-07-10"
        let date = dateString.toDate(format: "dd-MM-yyy")
        XCTAssertNil(date)
    }

}
