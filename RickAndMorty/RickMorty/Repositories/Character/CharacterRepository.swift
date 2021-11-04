//
//  CharacterRepository.swift
//  RickMorty
//
//  Created by Silvia España on 4/11/21.
//

import Foundation
import Combine

protocol CharacterRepository {
    
    func getAllCharacters()  -> AnyPublisher<Character, Error>
}
