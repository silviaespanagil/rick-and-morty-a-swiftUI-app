//
//  LocationDetailUseCase.swift
//  RickMorty
//
//  Created by Silvia España on 15/11/21.
//

import Foundation
import Combine

class GetLocationDetailUseCase {
    
    private let repository: LocationRepository
    
    init(repository: LocationRepository = LocationRepositoryImplementation()) {
        
        self.repository = repository
    }
    
    func execute(id: Int) -> AnyPublisher<Location, Error> {
        
        repository.getLocationDetail(id: id)
    }
}
