//
//  ServerResidentResponse.swift
//  RickMorty
//
//  Created by Silvia España on 12/11/21.
//

import Foundation

//TODO: TEST THE SERVER RESPONSE
struct ServerResidentResponse: Codable {
    
    let residents: String
    
    func convertToEntity() -> Resident {
        
        return Resident( resident: residents)
    }
}
