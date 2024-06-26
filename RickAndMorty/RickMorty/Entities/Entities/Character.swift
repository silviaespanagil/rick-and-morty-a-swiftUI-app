//
//  Character.swift
//  RickMorty
//
//  Created by Silvia España on 4/11/21.
//

import Foundation

struct Character: Identifiable, Equatable, Hashable {
    
    let id: Int
    let name: String
    var status: CharacterStatus
    let species: String
    let type: String
    let gender: String
    let origin: String
    let location: String
    let image: String
    let url: String
    let episode: [String]
}
