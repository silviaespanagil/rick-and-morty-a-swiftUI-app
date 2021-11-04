//
//  ServerBaseArrayResponse.swift
//  RickMorty
//
//  Created by Silvia España on 4/11/21.
//

import Foundation

struct ServerBaseArrayResponse<T: Codable>: Codable {

    let results: [T]
}
