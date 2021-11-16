//
//  EpisodeDetailUseCase.swift
//  RickMorty
//
//  Created by Silvia España on 16/11/21.
//

import Foundation
import Combine

class GetEpisodeDetailUseCase {
    
    private let repository: EpisodeRepository
    
    init(repository: EpisodeRepository = EpisodeRepositoryImplementation()) {
        
        self.repository = repository
    }
    
    func execute(id: Int) -> AnyPublisher<Episode, Error> {
        
        repository.getEpisodeDetail(id: id)
    }
}
