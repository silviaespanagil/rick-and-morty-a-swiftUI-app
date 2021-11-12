//
//  GetAllCharactersUseCase.swift
//  RickMorty
//
//  Created by Silvia España on 5/11/21.
//

import Foundation
import Combine

class GetAllCharactersUseCase {
    
    private let repository: CharacterRepository
    
    init(repository: CharacterRepository = CharacterRepositoryImplementation()) {
        
        self.repository = repository
    }
    
    func execute(page: Int) -> AnyPublisher<[Character], Error> {
        
        repository.getAllCharacters(page: page)
    }
}
