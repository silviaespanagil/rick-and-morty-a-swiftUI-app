//
//  Character.swift
//  RickMorty
//
//  Created by Silvia España on 4/11/21.
//

import Foundation

struct Character: Identifiable, Equatable {
    
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: String
    let location: String
    let image: String
    let url: String
}
