//
//  LocationRepositoryImplementation.swift
//  RickMorty
//
//  Created by Silvia España on 9/11/21.
//

import Foundation
import Combine

class LocationRepositoryImplementation: LocationRepository {
  
    private let remoteDataSource: LocationRemoteDataSource
    
    init(remoteDataSource: LocationRemoteDataSource = LocationRemoteDataSource()) {
        
        self.remoteDataSource = remoteDataSource
    }
    
    func getLocation() -> AnyPublisher<[Location], Error> {
        
        return remoteDataSource.getLocation().map {
            
            serverLocation -> [Location] in
            
            var locations: [Location] = []
            
            for serverLocation in serverLocation.results {
                
                let location = serverLocation.converToEntity()
                locations.append(location)
            }
            
            return locations
        }
        .mapError({ $0 })
        .eraseToAnyPublisher()
    }
}
