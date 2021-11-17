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
    static let getPage: String = "?page="
    private let baseURLString: String
    private let session: URLSession
    
    init(baseURL: String = Constants.baseURL, session: URLSession = URLSession.shared) {
        
        self.baseURLString = baseURL
        self.session = session
    }
    
    func getEpisode(page: Int) -> AnyPublisher<ServerBaseArrayResponse<ServerGetEpisodeResponse>, Error> {
        
        let apiManager = ApiManager(baseURL: baseURLString, session: session)
        
        let urlRequest = getEpisodeEndpoint(page: page)
        
        return apiManager.performRequest(urlRequest: urlRequest)
    }
    
    func getEpisodeDetail(id: Int) -> AnyPublisher<ServerResultResponse<ServerGetEpisodeResponse>, Error> {
        
        let apiManager = ApiManager(baseURL: baseURLString, session: session)
        
        let urlRequest = getEpisodeDetailEndpoint(id: id)
        
        return apiManager.performRequest(urlRequest: urlRequest)
    }
}

extension EpisodeRemoteDataSource {
    
    func getEpisodeEndpoint(page: Int) -> URLRequest {
        
        let endpoint = "\(baseURLString)\(EpisodeRemoteDataSource.getEpisodeURL)\(EpisodeRemoteDataSource.getPage)\(page)"
        
        let components = URLComponents(string: endpoint)
        
        let urlRequest = URLRequest(url: (components?.url!)!)
        
        return urlRequest
    }
    
    func getEpisodeDetailEndpoint(id: Int) -> URLRequest {
        
        let endpoint = "\(baseURLString)\(EpisodeRemoteDataSource.getEpisodeURL)/\(id)"
        
        let components = URLComponents(string: endpoint)
        
        let urlRequest = URLRequest(url: (components?.url!)!)
        
        return urlRequest
    }
}
