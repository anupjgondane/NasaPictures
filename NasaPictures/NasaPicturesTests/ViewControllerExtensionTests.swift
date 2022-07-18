//
//  ViewControllerExtensionTests.swift
//  NasaPicturesTests
//
//  Created by Anup Gondane on 18/07/22.
//

import XCTest
@testable import NasaPictures

class ViewControllerExtensionTests: XCTestCase {
    
    func testShowAlertActionSuccess() {
        let message = "Test"
        let status = UIViewController().showAlert(message: message)
        XCTAssertTrue(status)
    }
    
    func testShowAlertActionFailure() {
        let message = ""
        let status = UIViewController().showAlert(message: message)
        XCTAssertFalse(status)
    }
    
    func testShowActionAlertActionSuccess() {
        let message = "Test"
        let status = UIViewController().showActionAlert(message: message) {
        } cancelAction: {
        }
        XCTAssertTrue(status)
    }
    
    func testShowActionAlertActionFailure() {
        let message = ""
        let status = UIViewController().showActionAlert(message: message) {
        } cancelAction: {
        }
        XCTAssertFalse(status)
    }
}
