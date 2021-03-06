//
//  ServerGetEpisodeResponse.swift
//  RickMorty
//
//  Created by Silvia España on 9/11/21.
//

import Foundation

struct ServerGetEpisodeResponse: Codable {
    
    let id: Int
    let name: String
    let episode: String
    let airDate: String
    let characters: [String]
    
    func converToEntity() -> Episode {
        
        return Episode(id: id,
                       name: name.capitalizingFirstLetter(),
                       episode: episode,
                       airDate: airDate,
                       characters: characters)
    }
}
