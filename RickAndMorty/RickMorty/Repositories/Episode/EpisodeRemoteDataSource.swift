//
//  EpisodeRemoteDataSource.swift
//  RickMorty
//
//  Created by Silvia España on 9/11/21.
//

import Foundation
import Combine

class EpisodeRemoteDataSource {
    
    static let getEpisodeURL: String = "episode"
    private let baseURLString: String
    private let session: URLSession
    
    init(baseURL: String = Constants.baseURL, session: URLSession = URLSession.shared) {
        
        self.baseURLString = baseURL
        self.session = session
    }
    
    func getEpisode() -> AnyPublisher<ServerBaseArrayResponse<ServerGetEpisodeResponse>, Error> {
        
        let apiManager = ApiManager(baseURL: baseURLString, session: session)
        
        let urlRequest = getEpisodeEndpoint()
        
        return apiManager.performRequest(urlRequest: urlRequest)
    }
    
}


extension EpisodeRemoteDataSource {
    
    func getEpisodeEndpoint() -> URLRequest {
        
        let endpoint = "\(baseURLString)\(EpisodeRemoteDataSource.getEpisodeURL)"
        
        let components = URLComponents(string: endpoint)
        
        let urlRequest = URLRequest(url: (components?.url!)!)
        
        return urlRequest
        
    }
    
}
