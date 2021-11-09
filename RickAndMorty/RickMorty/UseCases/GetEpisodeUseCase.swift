//
//  GetEpisodeUseCase.swift
//  RickMorty
//
//  Created by Silvia España on 9/11/21.
//

import Foundation
import Combine

class GetEpisodeUseCase {
    
    private let repository: EpisodeRepository
    
    init(repository: EpisodeRepository = EpisodeRepositoryImplementation()) {
        
        self.repository = repository
    }
    
    func execute() -> AnyPublisher<[Episode], Error> {
        
        repository.getEpisode()
    }
}

