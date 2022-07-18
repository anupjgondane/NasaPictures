//
//  FavouritePictureViewModelTests.swift
//  NasaPicturesTests
//
//  Created by Anup Gondane on 18/07/22.
//

import XCTest
@testable import NasaPictures

class FavouritePictureViewModelTests: XCTestCase {

    func getPictureModelWithValues() -> PictureModel {
        let picture = PictureModel(context: PersistantStorage.shared.getContext())
        picture.title = "Title"
        picture.explaination = "Explaination"
        picture.date = "2022-07-16"
        return picture
    }
    
    func getPictureModelWithNoValues() -> PictureModel {
        let picture = PictureModel(context: PersistantStorage.shared.getContext())
        picture.title = ""
        picture.explaination = ""
        picture.date = ""
        return picture
    }
    
    func testPictureValuesNotEmpty() {
        let favouritePicture = FavouritePictureViewModel(picture: getPictureModelWithValues())
        XCTAssertFalse(favouritePicture.title.isEmpty)
        XCTAssertFalse(favouritePicture.description.isEmpty)
        XCTAssertFalse(favouritePicture.date.isEmpty)
    }

    func testPictureValuesEmpty() {
        let favouritePicture = FavouritePictureViewModel(picture: getPictureModelWithNoValues())
        XCTAssertTrue(favouritePicture.title.isEmpty)
        XCTAssertTrue(favouritePicture.description.isEmpty)
        XCTAssertTrue(favouritePicture.date.isEmpty)
    }
    
    func testFavouritePictureDateConvertSuccess() {
        let favouritePicture = FavouritePictureViewModel(picture: getPictureModelWithValues())
        let date = favouritePicture.responseDate.toDate(format: "yyyy-MM-dd")
        XCTAssertNotNil(date)
    }
    
    func testFavouritePictureDateConvertFailure() {
        let favouritePicture = FavouritePictureViewModel(picture: getPictureModelWithValues())
        let date = favouritePicture.date.toDate(format: "yyyy-MM-dd")
        XCTAssertNil(date)
    }
}
