//
//  LocationRepository.swift
//  RickMorty
//
//  Created by Silvia España on 9/11/21.
//

import Foundation
import Combine

protocol LocationRepository {
    
    func getLocation() -> AnyPublisher<[Location], Error>
}
