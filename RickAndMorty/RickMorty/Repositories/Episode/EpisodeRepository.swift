//
//  EpisodeRepository.swift
//  RickMorty
//
//  Created by Silvia España on 9/11/21.
//

import Foundation
import Combine

protocol EpisodeRepository {
    
    func getEpisode() -> AnyPublisher<[Episode], Error>
}
