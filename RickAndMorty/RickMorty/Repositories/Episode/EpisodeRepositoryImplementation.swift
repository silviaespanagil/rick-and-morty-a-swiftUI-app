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
    
    func getEpisode(page: Int) -> AnyPublisher<[Episode], Error> {
        
        return remoteDataSource.getEpisode(page: page).map {
            
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
    
    func getEpisodeDetail(id: Int) -> AnyPublisher<Episode, Error> {
        
        return remoteDataSource.getEpisodeDetail(id: id).map { serverEpisode -> Episode in

            // convert to entity
            let episode = serverEpisode.results.converToEntity()
            
            // Return
            return episode
        }
        .mapError({ $0 })
        .eraseToAnyPublisher()
    }
}
