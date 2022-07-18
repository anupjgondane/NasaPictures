//
//  FavouriteDetailsViewModelTests.swift
//  NasaPicturesTests
//
//  Created by Anup Gondane on 18/07/22.
//

import XCTest
@testable import NasaPictures

class FavouriteDetailsViewModelTests: XCTestCase {

    func getPictureModelWithValues() -> FavouritePictureViewModel {
        let picture = PictureModel(context: PersistantStorage.shared.getContext())
        picture.title = "Title"
        picture.explaination = "Explaination"
        picture.date = "2022-07-16"
        return FavouritePictureViewModel(picture: picture)
    }
    
    func getPictureModelWithNoValues() -> FavouritePictureViewModel {
        let picture = PictureModel(context: PersistantStorage.shared.getContext())
        picture.title = ""
        picture.explaination = ""
        picture.date = ""
        return FavouritePictureViewModel(picture: picture)
    }
    
    func testPictureValuesNotEmpty() {
        let favouritePicture = getPictureModelWithValues()
        XCTAssertFalse(favouritePicture.title.isEmpty)
        XCTAssertFalse(favouritePicture.description.isEmpty)
        XCTAssertFalse(favouritePicture.date.isEmpty)
    }

    func testPictureValuesEmpty() {
        let favouritePicture = getPictureModelWithNoValues()
        XCTAssertTrue(favouritePicture.title.isEmpty)
        XCTAssertTrue(favouritePicture.description.isEmpty)
        XCTAssertTrue(favouritePicture.date.isEmpty)
    }

    func testPictureDateConvertSuccess() {
        let favouritePicture = getPictureModelWithValues()
        let date = favouritePicture.responseDate.toDate(format: "yyyy-MM-dd")
        XCTAssertNotNil(date)
    }
    
    func testPictureDateConvertFailure() {
        let favouritePicture = getPictureModelWithValues()
        let date = favouritePicture.date.toDate(format: "yyyy-MM-dd")
        XCTAssertNil(date)
    }

}
