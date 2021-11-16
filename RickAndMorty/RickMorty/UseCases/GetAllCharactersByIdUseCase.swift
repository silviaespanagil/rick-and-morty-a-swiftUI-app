//
//  GetAllCharactersByIdUseCase.swift
//  RickMorty
//
//  Created by Xavi on 15/11/21.
//

import Foundation
import Combine

class GetAllCharactersByIdUseCase {
    
    private let repository: CharacterRepository
    
    init(repository: CharacterRepository = CharacterRepositoryImplementation()) {
        
        self.repository = repository
    }
    
    func execute(ids: [Int]) -> AnyPublisher<[Character], Error> {
        
        repository.getAllCharactersById(ids: ids)
    }
}
