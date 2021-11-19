//
//  Location.swift
//  RickMorty
//
//  Created by Silvia España on 9/11/21.
//

import Foundation

struct Location: Identifiable, Equatable {
    
    let id: Int
    let name: String
    let type: String
    let residents: [String]
    let dimension: String
}
