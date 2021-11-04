//
//  ServerCharacterResponse.swift
//  RickMorty
//
//  Created by Silvia España on 4/11/21.
//

import Foundation

struct ServerCharacterResponse: Codable {
    
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String?
    let gender: String
    let origin: ServerOriginResponse
    let location: ServerLocationResponse
    let image: String
    let url: String
    
    func converToEntity() -> Character {
        
        return Character(id: id,
                         name: name,
                         status: status,
                         species: species,
                         type: type ?? "",
                         gender: gender,
                         origin: origin.name,
                         location: location.name,
                         image: image,
                         url: url)
    }
}
