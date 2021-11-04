//
//  ServerResultsResponse.swift
//  RickMorty
//
//  Created by Silvia España on 4/11/21.
//

import Foundation

struct ServerResultResponse<T: Codable>: Codable {

    let results: T
}
