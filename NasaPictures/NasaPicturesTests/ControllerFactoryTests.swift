//
//  ControllerFactoryTests.swift
//  NasaPicturesTests
//
//  Created by Anup Gondane on 18/07/22.
//

import XCTest
@testable import NasaPictures

class ControllerFactoryTests: XCTestCase {

    func testCreateHomeViewController() {
        let homeVC = HomeViewController.getController(storyboard: UIStoryboard(name: "Main", bundle: .main))
        XCTAssertNotNil(homeVC)
    }

    func testCreateFavouriteViewController() {
        let favouriteVC = FavouritesViewController.getController(storyboard: UIStoryboard(name: "Main", bundle: .main))
        XCTAssertNotNil(favouriteVC)
    }

    func testCreateFavouriteDetailViewController() {
        let favouriteDetailVC = FavouriteDetailsViewController.getController(storyboard: UIStoryboard(name: "Main", bundle: .main))
        XCTAssertNotNil(favouriteDetailVC)
    }
    
    func testCreateDatePickerViewController() {
        let datePickerVC = DatePickerViewController.getController(storyboard: UIStoryboard(name: "Main", bundle: .main))
        XCTAssertNotNil(datePickerVC)
    }
    
}
