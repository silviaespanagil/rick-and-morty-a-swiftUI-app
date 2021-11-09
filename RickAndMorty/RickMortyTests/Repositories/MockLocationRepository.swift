//
//  MockLocationRepository.swift
//  RickMortyTests
//
//  Created by Silvia España on 9/11/21.
//

import XCTest
import Combine
@testable import RickMorty

class MockLocationRepository: LocationRepository {
    
    var isGetLocationCalled = false
    
    func getLocation() -> AnyPublisher<[Location], Error> {
        
        self.isGetLocationCalled = true
        
        return Just([])
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
    
}


