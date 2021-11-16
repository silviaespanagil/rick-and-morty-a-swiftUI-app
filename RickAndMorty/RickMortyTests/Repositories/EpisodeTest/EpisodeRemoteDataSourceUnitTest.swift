//
//  EpisodeRemoteDataSourceUnitTest.swift
//  RickMortyTests
//
//  Created by Silvia España on 9/11/21.
//

import XCTest
@testable import RickMorty

class EpisodeRemoteDataSourceUnitTest: XCTestCase {
    
    var sut: EpisodeRemoteDataSource?
    
    override func setUpWithError() throws {
      
        try super.setUpWithError()
        
        sut = EpisodeRemoteDataSource(baseURL: "http://jsonplaceholder.typicode.com/")
    }

    override func tearDownWithError() throws {
        
        sut = nil
        
        try super.tearDownWithError()
    }

    func testEpisodeEndpoint() {
        
        // Given
        let episode = "episode"
        
        // When
        let response = sut!.getEpisodeEndpoint()
        
        // Then
        XCTAssertNotNil(response)
        XCTAssertEqual(response.url?.absoluteString.split(separator: "?").first, "http://jsonplaceholder.typicode.com/\(episode)")
    }
    
    func testEpisodeDetailEndpoint() {
        
        // Given
        let endpoint = "episode/"
        let id = 1
        
        // When
        let response = sut!.getEpisodeDetailEndpoint(id: id)
        
        // Then
        XCTAssertNotNil(response)
        XCTAssertEqual(response.url?.absoluteString.split(separator: "?").first, "http://jsonplaceholder.typicode.com/\(endpoint)\(id)")
    }
}
