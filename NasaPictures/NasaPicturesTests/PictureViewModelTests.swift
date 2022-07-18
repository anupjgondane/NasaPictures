//
//  PictureViewModelTests.swift
//  NasaPicturesTests
//
//  Created by Anup Gondane on 18/07/22.
//

import XCTest
@testable import NasaPictures

class PictureViewModelTests: XCTestCase {
    
    func getPictureResponseWithValues() -> PictureResponse {
        return PictureResponse(date: "2022-07-16", explaination: "explain", mediaType: "image", title: "Title", url: "https://nasa.com", code: 200, message: "")
    }
    
    func getPictureResponseWithNoValues() -> PictureResponse {
        return PictureResponse(date: nil, explaination: nil, mediaType: nil, title: nil, url: nil, code: 400, message: "bad request")
    }

    func testPictureViewModelNotEmpty() {
        let picture = PictureViewModel(picture: getPictureResponseWithValues())
        XCTAssertTrue(!picture.title.isEmpty)
        XCTAssertTrue(!picture.description.isEmpty)
        XCTAssertTrue(!picture.date.isEmpty)
        XCTAssertTrue(!picture.url.isEmpty)
    }
    
    func testPictureViewModelEmpty() {
        let picture = PictureViewModel(picture: getPictureResponseWithNoValues())
        XCTAssertTrue(picture.title.isEmpty)
        XCTAssertTrue(picture.description.isEmpty)
        XCTAssertTrue(picture.date.isEmpty)
        XCTAssertTrue(picture.url.isEmpty)

    }

    func testPictureDateConvertSuccess() {
        let picture = PictureViewModel(picture: getPictureResponseWithValues())
        let date = picture.responseDate.toDate(format: "yyyy-MM-dd")
        XCTAssertNotNil(date)
    }
    
    func testPictureDateConvertFailure() {
        let picture = PictureViewModel(picture: getPictureResponseWithValues())
        let date = picture.date.toDate(format: "yyyy-MM-dd")
        XCTAssertNil(date)
    }

}
