//
//  CharacterRepositoryImplementation.swift
//  RickMorty
//
//  Created by Silvia España on 4/11/21.
//

import Foundation
import Combine

class CharacterRepositoryImplementation: CharacterRepository {
    
    private let remoteDataSource: CharacterRemoteDataSource
    
    init(remoteDataSource: CharacterRemoteDataSource = CharacterRemoteDataSource()) {
        
        self.remoteDataSource = remoteDataSource
    }
    
    func getAllCharacters() -> AnyPublisher<Character, Error> {
        
        return remoteDataSource.getAllCharacters().map { serverCharacter -> Character in
            
            let character = serverCharacter.results.converToEntity()
            
            return character
        }
        .mapError({ $0 })
        .eraseToAnyPublisher()
    }
}
