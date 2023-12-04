//
//  CatsAPITests.swift
//  CatsAPITests
//
//  Created by Letícia Victoria das Neves Sales on 30/11/23.
//

import XCTest
@testable import CatsAPI

class CatViewModelTests: XCTestCase {
    
    class MockCatViewModel: CatViewModel {
        var data: Data?
        
        override func fetchData(from url: URL, completion: @escaping (Data?) -> Void) {
            completion(data)
        }
    }
    
    func testFetchDataSuccess() {
        let viewModel = MockCatViewModel()
        let testData = "test".data(using: .utf8)
        viewModel.data = testData
        
        let expectation = XCTestExpectation(description: "Success")
        
        viewModel.fetchData(from: URL(string: "https://api.thecatapi.com/v1/breeds")!) { data in
            XCTAssertEqual(data, testData)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testFetchDataFailure() {
        let viewModel = MockCatViewModel()
        viewModel.data = nil
        
        let expectation = XCTestExpectation(description: "Failure")
        
        viewModel.fetchData(from: URL(string: "https://api.thecatapi.com/v1/breeds")!) { data in
            XCTAssertNil(data)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testDecodeCatsSuccess() {
        let viewModel = CatViewModel()
        let testData = """
        [{"name": "Bengal", "temperament": "Alert, Agile, Energetic"}]
        """.data(using: .utf8)!
        
        viewModel.decodeCats(from: testData)
        
        XCTAssertEqual(viewModel.cats.count, 1)
        XCTAssertEqual(viewModel.cats[0].name, "Bengal")
        XCTAssertEqual(viewModel.cats[0].temperament, "Alert, Agile, Energetic")
    }
    
    func testDecodeCatsFailure() {
        let viewModel = CatViewModel()
        let testData = "invalidData".data(using: .utf8)!
        
        viewModel.decodeCats(from: testData)
        
        XCTAssertEqual(viewModel.errorMessage, "Failed to decode data")
    }
}
