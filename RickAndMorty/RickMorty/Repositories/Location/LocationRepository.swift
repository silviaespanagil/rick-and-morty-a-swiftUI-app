//
//  LocationRepository.swift
//  RickMorty
//
//  Created by Silvia España on 9/11/21.
//

import Foundation
import Combine

protocol LocationRepository {
    
    func getLocation(page: Int) -> AnyPublisher<[Location], Error>
    
    func getLocationDetail(id: Int) -> AnyPublisher<Location, Error>
}
