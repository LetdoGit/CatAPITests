//
//  CatModel.swift
//  CatsAPI
//
//  Created by Letícia Victoria das Neves Sales on 30/11/23.
//

import Foundation

struct Cat: Decodable{
    let id: String
    let url: URL?
    let breeds: [CatBreed]
    let width: Int
    let height: Int
}
