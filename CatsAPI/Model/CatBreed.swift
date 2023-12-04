//
//  Breeds.swift
//  CatsAPI
//
//  Created by Letícia Victoria das Neves Sales on 30/11/23.
//

import Foundation

struct CatBreed: Decodable, Identifiable {
    let id: String
    let name: String
    let temperament: String
    let breedInformation: String
    let energyLevel: Int
    let isHairless: Bool
    
    //    var description: String {
    //        return "breed with name: \(name) and id \(id), energy level: \(energyLevel) isHairless: \(isHairless ? "YES" : "NO")"
    //    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case temperament
        case breedInformation = "description"
        case energyLevel = "energy_level"
        case isHairless = "hairless"
        case image
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try values.decode(String.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        temperament = try values.decode(String.self, forKey: .temperament)
        breedInformation = try values.decode(String.self, forKey: .breedInformation)
        energyLevel = try values.decode(Int.self, forKey: .energyLevel)
        
        let hairless = try values.decode(Int.self, forKey: .isHairless)
        isHairless = hairless == 1
        
    }
    
    init(id: String, name: String, explaination: String, temperament: String,
         energyLevel: Int, isHairless: Bool){
        self.id = id
        self.name = name
        self.breedInformation = explaination
        self.energyLevel = energyLevel
        self.temperament = temperament
        self.isHairless = isHairless
    }
    
    static func example1() -> CatBreed {
        return CatBreed(id: "abys",
                     name: "Abyssinian",
                     explaination: "The Abyssinian is easy to care for, and a joy to have in your home. They’re affectionate cats and love both people and other animals.",
                     temperament: "Active, Energetic, Independent, Intelligent, Gentle",
                     energyLevel: 5,
                     isHairless: false)
    
    }
}
