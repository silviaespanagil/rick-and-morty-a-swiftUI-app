//
//  GetLocationUseCase.swift
//  RickMorty
//
//  Created by Silvia España on 9/11/21.
//

import Foundation
import Combine

class GetLocationUseCase {
    
    private let repository: LocationRepository
    
    init(repository: LocationRepository = LocationRepositoryImplementation()) {
        
        self.repository = repository
    }
    
    func execute(page: Int) -> AnyPublisher<[Location], Error> {
        
        repository.getLocation(page: page)
    }
}
