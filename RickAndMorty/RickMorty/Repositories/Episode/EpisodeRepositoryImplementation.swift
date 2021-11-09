//
//  EpisodeRepositoryImplementation.swift
//  RickMorty
//
//  Created by Silvia España on 9/11/21.
//

import Foundation
import Combine

class EpisodeRepositoryImplementation: EpisodeRepository {
  
    private let remoteDataSource: EpisodeRemoteDataSource
    
    init(remoteDataSource: EpisodeRemoteDataSource = EpisodeRemoteDataSource()) {
        
        self.remoteDataSource = remoteDataSource
    }
    
    func getEpisode() -> AnyPublisher<[Episode], Error> {
        
        return remoteDataSource.getEpisode().map {
            
            serverEpisode -> [Episode] in
            
            var episodes: [Episode] = []
            
            for serverEpisode in serverEpisode.results {
                
                let episode = serverEpisode.converToEntity()
                episodes.append(episode)
            }
            
            return episodes
        }
        .mapError({ $0 })
        .eraseToAnyPublisher()
    }
}
