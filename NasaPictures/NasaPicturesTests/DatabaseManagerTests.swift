//
//  DatabaseManagerTests.swift
//  NasaPicturesTests
//
//  Created by Anup Gondane on 18/07/22.
//

import XCTest
@testable import NasaPictures

class DatabaseManagerTests: XCTestCase {
    
    func getPictureData() -> Data {
        let responseString = "{\n  \"date\": \"2022-07-16\",\n  \"explanation\": \"Stephan's Quintet from just: Webb, Hubble\",\n  \"hdurl\": \"https://apod.nasa.gov/apod/image/2207/Quintet_JwstHstEtcGendler_2413.jpg\",\n  \"media_type\": \"image\",\n  \"title\": \"Stephan's Quintet from Webb, Hubble, and Subaru\",\n  \"url\": \"https://apod.nasa.gov/apod/image/2207/Quintet_JwstHstEtcGendler_960.jpg\"\n}"
        return responseString.data(using: .utf8)!
    }
    
    func testSavePicture() {
        DatabaseManager.shared.savePicture(responseData: getPictureData())
        let lastPicture = DatabaseManager.shared.getLastPicture()
        XCTAssertNotNil(lastPicture)
    }
    
    
}
