//
//  CharacterRepository.swift
//  RickMorty
//
//  Created by Silvia España on 4/11/21.
//

import Foundation
import Combine

protocol CharacterRepository {
    
    func getAllCharacters(page: Int)  -> AnyPublisher<[Character], Error>
    
    func getCharacterDetail(id: Int) -> AnyPublisher<Character, Error>
    
    func getAllCharactersById(ids: [Int]) -> AnyPublisher<[Character], Error>
}
