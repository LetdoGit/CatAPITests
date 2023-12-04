//
//  CatsAPITests.swift
//  CatsAPITests
//
//  Created by Letícia Victoria das Neves Sales on 30/11/23.
//

import XCTest
@testable import CatsAPI

class CatViewModelTest: XCTestCase {
    
    func testAPISuccess() {
        let mockService = MockCatService()
        guard let cats = mockService.cats() else { return }
        mockService.result = .success(cats)
        
        let sut = CatViewModel(catViewService: mockService)
        sut.fetchCats()
        
        XCTAssert(sut.cats.count == 1)
    }
    
    func testAPIFailure() {
        let mockService = MockCatService()
        mockService.result = .failure(.noData)
        
        let sut = CatViewModel(catViewService: mockService)
        sut.fetchCats()
        
        XCTAssert(sut.cats.isEmpty)
    }
}
