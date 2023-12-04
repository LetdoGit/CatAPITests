//
//  MockCatViewModel.swift
//  CatsAPI
//
//  Created by Letícia Victoria das Neves Sales on 03/12/23.
//

import Foundation

class MockCatViewModel: CatViewModel {
    var data: Data?
    var catBreeds: [CatBreed]?
    var errorMessageToReturn: String?
    
    override func fetchData(from url: URL, completion: @escaping (Data?) -> Void) {
        completion(data)
    }
    
    override func decodeCats(from data: Data) {
        if let cats = catBreeds {
            self.cats = cats
        } else {
            self.errorMessage = errorMessageToReturn ?? "Failed to decode data"
        }
    }
}

