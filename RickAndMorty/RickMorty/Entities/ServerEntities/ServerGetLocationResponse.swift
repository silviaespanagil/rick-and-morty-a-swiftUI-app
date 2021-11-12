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
    let residents: [ServerResidentResponse]?
    let dimension: String
    
    func converToEntity() -> Location {
        
        var res: [Resident] = []
        if let serverResidents = residents {
            res = serverResidents.map({ $0.convertToEntity()})
        }
        
        return Location(id: id,
                         name: name,
                         type: type,
                        residents: res,
                         dimension: dimension)
    }
}
