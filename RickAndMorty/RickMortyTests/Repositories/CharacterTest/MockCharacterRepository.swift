//
//  MockCharacterRepository.swift
//  RickMortyTests
//
//  Created by Silvia España on 9/11/21.
//

import XCTest
import Combine
@testable import RickMorty

class MockCharacterRepository: CharacterRepository {
    
    var isGetAllCharactersCalled = false
    var isGetCharacterDetailCalled = false
    var isgetAllCharactersByIdCalled = false
    
    func getAllCharacters(page: Int) -> AnyPublisher<[Character], Error> {
        
        self.isGetAllCharactersCalled = true
        
        return Just([])
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
    
    func getCharacterDetail(id: Int) -> AnyPublisher<Character, Error> {
        
        self.isGetCharacterDetailCalled = true
        
        return Just(Character(id: 1,
                              name: "",
                              status: CharacterStatus(rawValue: "Unknown")!,
                              species: "",
                              type: "",
                              gender: "",
                              origin: "",
                              location: "",
                              image: "",
                              url: "",
                              episode: [""]))
        
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
    
    func getAllCharactersById(ids: [Int]) -> AnyPublisher<[Character], Error> {
        
        self.isgetAllCharactersByIdCalled = true
        
        return Just([])
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}

