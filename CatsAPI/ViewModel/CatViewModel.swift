//
//  CatViewModel.swift
//  CatsAPI
//
//  Created by Letícia Victoria das Neves Sales on 30/11/23.
//

import Foundation

class CatViewModel: ObservableObject {
    
    @Published var cats: [CatBreed] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    init(){
        fetchData()
    }
    
    func fetchData() {
        isLoading = true
        guard let url = URL(string: "https://api.thecatapi.com/v1/breeds") else {
            self.isLoading = false
            self.errorMessage = "Invalid URL"
            return
        }
        
        fetchData(from: url) { [weak self] data in
            DispatchQueue.main.async {
                self?.isLoading = false
            }
            
            if let data = data {
                self?.decodeCats(from: data)
            }
        }
    }
    
    func fetchData(from url: URL, completion: @escaping (Data?) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            completion(data)
        }
        task.resume()
    }
    
    func decodeCats(from data: Data) {
        do {
            let cats = try JSONDecoder().decode([CatBreed].self, from: data)
            
            DispatchQueue.main.async {
                self.cats = cats
            }
        } catch {
            print(error)
            DispatchQueue.main.async {
                self.errorMessage = "Failed to decode data"
            }
        }
    }
}

//
//class CatViewModel: ObservableObject {
//    
//    @Published var cats: [CatBreed] = []
//    @Published var isLoading: Bool = false
//    @Published var errorMessage: String? = nil
//    
//    init(){
//        fetchAllBreeds()
//    }
//    
//    func fetchAllBreeds() {
//        
//        isLoading = true
//        
////        guard var urlComponents = URLComponents(string: "https://api.thecatapi.com/v1/images/search") else {
////            APIError.badURL.localizedDescription
////            return
////        }
////        urlComponents.queryItems = [URLQueryItem(name: "apiCat", value: "live_EpchRaXMjiqgQUf3g6PEJ1AOwZXQ9wooSzckQHJ26KiSUvU2WGbH6ttw4Xg7YfNP")]
////        
////        guard let url = urlComponents.url else {return}
//        
//        var request = URLRequest(url: URL(string: "https://api.thecatapi.com/v1/images/search?limit=10&breed_ids=beng&api_key=live_EpchRaXMjiqgQUf3g6PEJ1AOwZXQ9wooSzckQHJ26KiSUvU2WGbH6ttw4Xg7YfNP")!)
//        var url = URL(string: "https://api.thecatapi.com/v1/breeds")
//        let task = URLSession.shared.dataTask(with: url!) { [weak self] data, response, error in
//            
//            DispatchQueue.main.async {
//                self!.isLoading = false
//            }
//            
//            if let data = data {
//                
//                do{
//                    let cats = try JSONDecoder().decode([CatBreed].self, from: data)
//                    
//                    DispatchQueue.main.async {
//                        self?.cats = cats
//                    }
//                    
//                } catch {
//                    
//                    print(error)
//                    
//                }
//            }
//        }
//        task.resume()
//        
//    }
//}
