//
//  BreedImage.swift
//  CatsAPI
//
//  Created by Letícia Victoria das Neves Sales on 30/11/23.
//

import Foundation

struct CatImage: Decodable, Identifiable {
    let id: String
    let url: URL
    let breeds: [CatBreed]
}
