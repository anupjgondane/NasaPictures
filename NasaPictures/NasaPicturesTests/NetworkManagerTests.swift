//
//  NetworkManagerTests.swift
//  NasaPicturesTests
//
//  Created by Anup Gondane on 18/07/22.
//

import XCTest
@testable import NasaPictures

class NetworkManagerTests: XCTestCase {
    func testNetworkRequestFailure() {
        let expectation = self.expectation(description: "NetworkFailure")
        NetworkManager().request(method: .get, urlString: "") { result in
            switch result {
            case .failure(let error):
                XCTAssertTrue(error.message() == NetworkError.invalidUrl.message())
            default:
                break
            }
            expectation.fulfill()
        }
        self.waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testNetworkRequestSuccess() {
        let expectation = self.expectation(description: "NetworkSuccess")
        NetworkManager().request(method: .get, urlString: ApiConstant.picOfDayUrl) { result in
            switch result {
            case .success(let data):
                XCTAssertNotNil(data)
            default:
                break
            }
            expectation.fulfill()
        }
        self.waitForExpectations(timeout: 5, handler: nil)
    }
}
