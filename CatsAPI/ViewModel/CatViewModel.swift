//
//  CatViewModel.swift
//  CatsAPI
//
//  Created by Letícia Victoria das Neves Sales on 30/11/23.
//

import Foundation
import SwiftUI

class CatViewModel: ObservableObject {
    
    @Published var cats: [CatImage] = []
    @Published var breeds: [CatBreed] = []
    
    private let catViewService: CatViewServiceDelegate
    
    init(catViewService: CatViewServiceDelegate = CatViewService()){
        self.catViewService = catViewService
    }
    
    func fetchCats() {
        catViewService.fetchCatData { result in
            switch result {
            case .success(let cats):
                DispatchQueue.main.async {
                    self.cats = cats ?? []
                    print(cats)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
