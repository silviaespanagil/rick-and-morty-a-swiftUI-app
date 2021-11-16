//
//  MockEpisodeRepository.swift
//  RickMortyTests
//
//  Created by Silvia España on 9/11/21.
//

import XCTest
import Combine
@testable import RickMorty

class MockEpisodeRepository: EpisodeRepository {
    
    var isGetEpisodeCalled = false
    var isGetEpisodeDetailCalled = false
    
    func getEpisode() -> AnyPublisher<[Episode], Error> {
        
        self.isGetEpisodeCalled = true
        
        return Just([])
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
    
    func getEpisodeDetail(id: Int) -> AnyPublisher<Episode, Error> {
        
        self.isGetEpisodeDetailCalled = true
        
        return Just(Episode(id: 1,
                            name: "",
                            episode: "",
                            airDate: "",
                            characters: [""]))
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
