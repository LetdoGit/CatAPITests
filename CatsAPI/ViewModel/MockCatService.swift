//
//  MockCatViewModel.swift
//  CatsAPI
//
//  Created by Letícia Victoria das Neves Sales on 03/12/23.
//

import Foundation

class MockCatService: CatViewServiceDelegate {

    var result: Result<[CatImage], DemoError>?

    func cats() -> [CatImage]? {
        do {
            guard let fileURL = Bundle.main.url(forResource: "CatsMock", withExtension: "json") else {
                return nil
            }
            let data = try Data(contentsOf: fileURL)
            return try JSONDecoder().decode([CatImage].self, from: data)
            
        } catch let error {
            print(error.localizedDescription)
            return nil
        }
    }

    func fetchCatData(completion: @escaping (Result<[CatImage]?, DemoError>) -> Void) {
        if let result = result {
            let catResult: Result<[CatImage]?, DemoError> = result.map { $0 }
            completion(catResult)
        } else {
            let errorResult: Result<[CatImage]?, DemoError> = .failure(.noData)
            completion(errorResult)
        }
    }
}
