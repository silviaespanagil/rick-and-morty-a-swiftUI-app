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
    
    func getAllCharacters() -> AnyPublisher<[Character], Error> {
        
        return remoteDataSource.getAllCharacters().map { serverCharacter -> [Character] in
            
            
            var characters: [Character] = []
            
            for serverCharacter in serverCharacter.results {
                
                let character = serverCharacter.converToEntity()
                characters.append(character)
            }
            
            return characters
        }
        .mapError({ $0 })
        .eraseToAnyPublisher()
    }
    
    func getCharacterDetail(id: Int) -> AnyPublisher<Character, Error> {
        
        return remoteDataSource.getCharacterDetail(id: id).map { serverCharacter -> Character in

            // convert to entity
            let character = serverCharacter.results.converToEntity()
            
            // Return
            return character
        }
        .mapError({ $0 })
        .eraseToAnyPublisher()
    }
}
