//
//  EpisodesRepositoryImplementationUnitTest.swift
//  RickMortyTests
//
//  Created by Silvia España on 10/11/21.
//

import XCTest
import Combine
@testable import RickMorty

class EpisodesRepositoryImplementationUnitTest: XCTestCase {
    
    var sut: EpisodeRepositoryImplementation!
    
    var cancellable: AnyCancellable?
    
    let baseUrlString = "http://jsonplaceholder.typicode.com/"
    
    let sucessStatusCode = 200
    let failureStatusCode = 401
    let timeoutTime: TimeInterval = 2
    
    override func setUpWithError() throws {
        
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        
        sut = nil
        try super.tearDownWithError()
    }

    func testGetAllEpisodesOK() throws {
        
        // Given
        let endpoint = "episode"
        let session = getEpisodeSession(statusCode: sucessStatusCode, endpoint: endpoint)
        
        let remote = EpisodeRemoteDataSource(baseURL: baseUrlString, session: session)
        
        sut = EpisodeRepositoryImplementation(remoteDataSource: remote)
        
        let exp = self.expectation(description: "expected values")
        
        // When
        cancellable = sut!.getEpisode()
            .sink(receiveCompletion: { completion in
                
                switch completion {
                case .finished:
                    exp.fulfill()
                case .failure:
                    break
                }
                
            }, receiveValue: { episode in
                
                XCTAssertEqual(episode.count, 1)
                XCTAssertEqual(episode.first?.id, 1)
                XCTAssertEqual(episode.first?.name, "Pilot")
                XCTAssertEqual(episode.first?.airDate, "Episode air date")
                XCTAssertEqual(episode.first?.episode, "Episode number")
            })
        
        wait(for: [exp], timeout: timeoutTime)
        
        // Then
        XCTAssertNotNil(cancellable)
    }
}

extension EpisodesRepositoryImplementationUnitTest {
    
    func getEpisodeSession(statusCode: Int, endpoint: String) -> URLSession {
        
        // URL we expect to call
        let url = URL(string: "http://jsonplaceholder.typicode.com/\(endpoint)")
        
        // data we expect to receive
        let data = getEpisodeData()
        
        // attach that to some fixed data in our protocol handler
        URLProtocolMock.testURLs = [url: data]
        URLProtocolMock.response = HTTPURLResponse(url: URL(string: "http://jsonplaceholder.typicode.com:8080")!,
                                                   statusCode: statusCode,
                                                   httpVersion: nil,
                                                   headerFields: nil)
        
        // now setup a configuration to use our mock
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [URLProtocolMock.self]
        
        // and ceate the URLSession form that
        let session = URLSession(configuration: config)
        
        return session
    }
    
    func getEpisodeData() -> Data {
        
        let dataString = """
                    
                    {
                        "results":[
                              {
                                 "id":1,
                                 "name":"Pilot",
                                 "air_date":"Episode air date",
                                 "episode":"Episode number",
                                 "characters":[
                                    "https://rickandmortyapi.com/api/character/1",
                                    "https://rickandmortyapi.com/api/character/2",
                                    "https://rickandmortyapi.com/api/character/35",
                                    "https://rickandmortyapi.com/api/character/38",
                                    "https://rickandmortyapi.com/api/character/62",
                                    "https://rickandmortyapi.com/api/character/92",
                                    "https://rickandmortyapi.com/api/character/127",
                                    "https://rickandmortyapi.com/api/character/144",
                                    "https://rickandmortyapi.com/api/character/158",
                                    "https://rickandmortyapi.com/api/character/175",
                                    "https://rickandmortyapi.com/api/character/179",
                                    "https://rickandmortyapi.com/api/character/181",
                                    "https://rickandmortyapi.com/api/character/239",
                                    "https://rickandmortyapi.com/api/character/249",
                                    "https://rickandmortyapi.com/api/character/271",
                                    "https://rickandmortyapi.com/api/character/338",
                                    "https://rickandmortyapi.com/api/character/394",
                                    "https://rickandmortyapi.com/api/character/395",
                                    "https://rickandmortyapi.com/api/character/435"
                                 ],
                                 "url":"https://rickandmortyapi.com/api/episode/1",
                                 "created":"2017-11-10T12:56:33.798Z"
                              }
                           ]
                    }
                    
                    """

        return Data(dataString.utf8)
    }
}
