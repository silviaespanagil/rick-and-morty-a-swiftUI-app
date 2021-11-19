//
//  ServerGetLocationResponse.swift
//  RickMorty
//
//  Created by Silvia España on 9/11/21.
//

import Foundation

struct ServerGetLocationResponse: Codable {
    
    let id: Int
    let name: String
    let type: String
    let residents: [String]
    let dimension: String
    
    func converToEntity() -> Location {
        
        return Location(id: id,
                        name: name.capitalizingFirstLetter(),
                        type: type,
                        residents: residents,
                        dimension: dimension)
    }
}
