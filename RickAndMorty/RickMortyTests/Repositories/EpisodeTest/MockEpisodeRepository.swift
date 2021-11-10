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
    
    func getEpisode() -> AnyPublisher<[Episode], Error> {
        
        self.isGetEpisodeCalled = true
        
        return Just([])
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
