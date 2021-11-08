//
//  CharacterRemoteDataSource.swift
//  RickMorty
//
//  Created by Silvia España on 4/11/21.
//

import Foundation
import Combine

class CharacterRemoteDataSource {
    
    static let getAllCharactersURL: String = "character"
    private let baseURLString: String
    private let session: URLSession
    
    init(baseURL: String = Constants.baseURL, session: URLSession = URLSession.shared) {
        
        self.baseURLString = baseURL
        self.session = session
    }
        
    func getAllCharacters() -> AnyPublisher<ServerBaseArrayResponse<ServerCharacterResponse>, Error> {
        
        let apiManager = ApiManager(baseURL: baseURLString, session: session)
        
        let urlRequest = getAllCharactersEndpoint()
        
        return apiManager.performRequest(urlRequest: urlRequest)
    }
}


extension CharacterRemoteDataSource {
    
    func getAllCharactersEndpoint() -> URLRequest {
        
        let endpoint = "\(baseURLString)\(CharacterRemoteDataSource.getAllCharactersURL)"
        
        let components = URLComponents(string: endpoint)
        
        let urlRequest = URLRequest(url: (components?.url!)!)
        
        return urlRequest
        
    }
}
