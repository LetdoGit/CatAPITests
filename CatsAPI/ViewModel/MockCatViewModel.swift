//
//  MockCatViewModel.swift
//  CatsAPI
//
//  Created by Letícia Victoria das Neves Sales on 03/12/23.
//

import Foundation

class MockCatViewModel: ObservableObject {
    @Published var cats: [CatImage] = []
    @Published var breeds: [CatBreed] = []
    
    var fetchCatsCalled = false
    
    func fetchCats() {
        fetchCatsCalled = true
        
        let mockCatData = [
            CatImage(id: "1", url: URL(string: "https://ghayagatil.com.br/wp-content/uploads/2018/04/Azul-Russo.jpg")!, breeds: [
                CatBreed(id: "1", name: "Russian Blue", temperament: "Quiet, Calm", reference_image_id: "1")
            ]),
            CatImage(id: "2", url: URL(string: "https://imgur.com/a/xy0JaZM")!, breeds: [
                CatBreed(id: "2", name: "Listrado", temperament: "Likes chicken, Fat", reference_image_id: "2")
            ]),
        ]
        
        self.cats = mockCatData
        self.breeds = mockCatData.flatMap { $0.breeds }
    }
}
