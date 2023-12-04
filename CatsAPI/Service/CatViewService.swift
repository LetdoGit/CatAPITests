//
//  CatViewService.swift
//  CatsAPI
//
//  Created by Letícia Victoria das Neves Sales on 04/12/23.
//

import Foundation

enum DemoError: Error {
    case badURL
    case noData
    case decodingError
}

protocol CatViewServiceDelegate {
    func fetchCatData(completion: @escaping (Result<[CatImage]?, DemoError>) -> Void)
}

class CatViewService: CatViewServiceDelegate {
    func fetchCatData(completion: @escaping (Result<[CatImage]?, DemoError>) -> Void) {
        guard let url = URL(string: "https://api.thecatapi.com/v1/images/search?api_key=live_EpchRaXMjiqgQUf3g6PEJ1AOwZXQ9wooSzckQHJ26KiSUvU2WGbH6ttw4Xg7YfNP&limit=100") else {
            return completion(.failure(.badURL))
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }

            do {
                let catResponse = try JSONDecoder().decode([CatImage].self, from: data)
                completion(.success(catResponse))
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
}
