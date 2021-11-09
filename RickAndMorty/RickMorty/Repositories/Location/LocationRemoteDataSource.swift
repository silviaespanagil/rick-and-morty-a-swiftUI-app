//
//  LocationRemoteDataSource.swift
//  RickMorty
//
//  Created by Silvia España on 9/11/21.
//

import Foundation
import Combine

class LocationRemoteDataSource {
    
    static let getLocationURL: String = "location"
    private let baseURLString: String
    private let session: URLSession
    
    init(baseURL: String = Constants.baseURL, session: URLSession = URLSession.shared) {
        
        self.baseURLString = baseURL
        self.session = session
    }
    
    func getLocation() -> AnyPublisher<ServerBaseArrayResponse<ServerGetLocationResponse>, Error> {
        
        let apiManager = ApiManager(baseURL: baseURLString, session: session)
        
        let urlRequest = getLocationEndpoint()
        
        return apiManager.performRequest(urlRequest: urlRequest)
    }
    
}


extension LocationRemoteDataSource {
    
    func getLocationEndpoint() -> URLRequest {
        
        let endpoint = "\(baseURLString)\(LocationRemoteDataSource.getLocationURL)"
        
        let components = URLComponents(string: endpoint)
        
        let urlRequest = URLRequest(url: (components?.url!)!)
        
        return urlRequest
        
    }
    
}
