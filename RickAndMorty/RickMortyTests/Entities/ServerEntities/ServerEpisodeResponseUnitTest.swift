//
//  ServerEpisodeResponseUnitTest.swift
//  RickMortyTests
//
//  Created by Silvia España on 10/11/21.
//

import XCTest
@testable import RickMorty

class ServerEpisodeResponseUnitTest: XCTestCase {

    override func setUpWithError() throws {
        
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        
        try super.tearDownWithError()
    }
    
    func testEpisodeConvertToEntity() throws {
        
        // Given
        let serverEpisodeResponse = ServerGetEpisodeResponse(id: 1,
                                                               name: "name",
                                                               episode: "episode",
                                                               airDate: "airDate")
        
        // When
        let episode = serverEpisodeResponse.converToEntity()
        
        // Then
        XCTAssertEqual(episode.id, serverEpisodeResponse.id)
        XCTAssertEqual(episode.name, serverEpisodeResponse.name)
        XCTAssertEqual(episode.episode, serverEpisodeResponse.episode)
        XCTAssertEqual(episode.airDate, serverEpisodeResponse.airDate)
    }
}
