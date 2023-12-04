//
//  CatsAPITests.swift
//  CatsAPITests
//
//  Created by Letícia Victoria das Neves Sales on 30/11/23.
//

import XCTest
import Combine
@testable import CatsAPI

class CatViewModelTest: XCTestCase {
    
    func testAPISuccess() {
       
        let mockService = MockCatService()
        guard let cats = mockService.cats() else { return }
        mockService.result = .success(cats)
        
        let catVM = CatViewModel(catViewService: mockService)
        
        catVM.fetchCats()
                
        XCTAssert(!catVM.cats.isEmpty)
    }
    
    func testAPIFailure() {
        let mockService = MockCatService()
        mockService.result = .failure(.noData)
        
        let catVM = CatViewModel(catViewService: mockService)
        catVM.fetchCats()
        
        XCTAssert(catVM.cats.isEmpty)
    }
}
