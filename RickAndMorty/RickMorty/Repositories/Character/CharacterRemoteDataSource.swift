//
//  CharacterRemoteDataSource.swift
//  RickMorty
//
//  Created by Silvia España on 4/11/21.
//

import Foundation
import Combine

class CharacterRemoteDataSource {
    
    static let getAllCharactersURL: String = "character/"
    static let getPage: String = "?page="
    private let baseURLString: String
    private let session: URLSession
    
    init(baseURL: String = Constants.baseURL, session: URLSession = URLSession.shared) {
        
        self.baseURLString = baseURL
        self.session = session
    }
    
    func getAllCharacters(page: Int) -> AnyPublisher<ServerBaseArrayResponse<ServerCharacterResponse>, Error> {
        
        let apiManager = ApiManager(baseURL: baseURLString, session: session)
        
        let urlRequest = getAllCharactersEndpoint(page: page)
        
        return apiManager.performRequest(urlRequest: urlRequest)
    }
    
    func getCharacterDetail(id: Int) -> AnyPublisher<ServerCharacterResponse, Error> {
        
        let apiManager = ApiManager(baseURL: baseURLString, session: session)
        
        let urlRequest = getCharacterDetailEndpoint(id: id)
        
        return apiManager.performRequest(urlRequest: urlRequest)
    }
}

extension CharacterRemoteDataSource {
    
    func getAllCharactersEndpoint(page: Int) -> URLRequest {
        
        let endpoint = "\(baseURLString)\(CharacterRemoteDataSource.getAllCharactersURL)\(CharacterRemoteDataSource.getPage)\(page)"
        
        let components = URLComponents(string: endpoint)
        
        let urlRequest = URLRequest(url: (components?.url!)!)
        
        return urlRequest
        
    }
    
    func getCharacterDetailEndpoint(id: Int) -> URLRequest {
        
        let endpoint = "\(baseURLString)\(CharacterRemoteDataSource.getAllCharactersURL)\(id)"
        
        let components = URLComponents(string: endpoint)
        
        let urlRequest = URLRequest(url: (components?.url!)!)
        
        return urlRequest
    }
}
