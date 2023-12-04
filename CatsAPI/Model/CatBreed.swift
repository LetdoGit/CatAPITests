//
//  Breeds.swift
//  CatsAPI
//
//  Created by Letícia Victoria das Neves Sales on 30/11/23.
//

import Foundation

struct CatBreed: Decodable, Identifiable {
    var id: String
    let name: String
    let temperament: String
    let reference_image_id: String?
}
