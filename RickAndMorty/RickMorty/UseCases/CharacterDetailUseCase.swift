//
//  CharacterDetailUseCase.swift
//  RickMorty
//
//  Created by Silvia España on 8/11/21.
//

import Foundation
import Combine

class GetCharacterDetailUseCase {
    
    private let repository: CharacterRepository
    
    init(repository: CharacterRepository = CharacterRepositoryImplementation()) {
        
        self.repository = repository
    }
    
    func execute(id: Int) -> AnyPublisher<Character, Error> {
        
        repository.getCharacterDetail(id: id)
    }
}
