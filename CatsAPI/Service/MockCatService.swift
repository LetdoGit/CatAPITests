//
//  MockCatViewModel.swift
//  CatsAPI
//
//  Created by Letícia Victoria das Neves Sales on 03/12/23.
//

import Foundation

class MockCatService: CatViewServiceDelegate {

    var result: Result<[CatImage], NetworkError>?

    func cats() -> [CatImage]? {
        do {
            guard let fileURL = Bundle.main.url(forResource: "CatsMock", withExtension: "json") else {
                throw NetworkError.noData
            }
            let data = try Data(contentsOf: fileURL)
            return try JSONDecoder().decode([CatImage].self, from: data)
        } catch {
            print("Error loading CatsMock.json: \(error.localizedDescription)")
            return nil
        }
    }

    func fetchCatData(completion: @escaping (Result<[CatImage]?, NetworkError>) -> Void) {
        if let result = result {
            completion(result.map { $0 })
        } else {
            completion(.failure(.noData))
        }
    }
}
