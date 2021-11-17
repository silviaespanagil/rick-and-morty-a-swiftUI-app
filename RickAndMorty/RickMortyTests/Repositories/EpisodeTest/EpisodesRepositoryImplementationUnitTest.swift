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
        let page = 1
        let session = getEpisodeSession(statusCode: sucessStatusCode, endpoint: endpoint, page: page)
        
        let remote = EpisodeRemoteDataSource(baseURL: baseUrlString, session: session)
        
        sut = EpisodeRepositoryImplementation(remoteDataSource: remote)
        
        let exp = self.expectation(description: "expected values")
        
        // When
        cancellable = sut!.getEpisode(page: page)
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
                XCTAssertEqual(episode.first?.airDate, "December 2, 2013")
                XCTAssertEqual(episode.first?.episode, "S01E01")
            })
        
        wait(for: [exp], timeout: timeoutTime)
        
        // Then
        XCTAssertNotNil(cancellable)
    }
    
    func testGetAllEpisodesError() throws {
        
        // Given
        let endpoint = "episode"
        let page = 1
        let session = getEpisodeSession(statusCode: failureStatusCode, endpoint: endpoint, page: page)
        
        let remote = EpisodeRemoteDataSource(baseURL: baseUrlString, session: session)
        
        sut = EpisodeRepositoryImplementation(remoteDataSource: remote)
        
        let exp = self.expectation(description: "expected values")
        
        // When
        cancellable = sut!.getEpisode(page: page)
            .sink(receiveCompletion: { completion in
                
                switch completion {
                case .finished:
                    break
                case .failure:
                    exp.fulfill()
                }
                
            }, receiveValue: { episode in
                
                // nothing
            })
        
        wait(for: [exp], timeout: timeoutTime)
        
        // Then
        XCTAssertNotNil(cancellable)
    }
    
    func testGetEpisodeDetail() throws {
        
        // Given
        let endpoint = "episode"
        let id = 1
        let session = getEpisodeDetailSession(statusCode: sucessStatusCode, endpoint: endpoint, id: id)
        
        let remote = EpisodeRemoteDataSource(baseURL: baseUrlString, session: session)
        
        sut = EpisodeRepositoryImplementation(remoteDataSource: remote)
        
        let exp = self.expectation(description: "expected values")
        
        // When
        cancellable = sut!.getEpisodeDetail(id: id)
            .sink(receiveCompletion: { completion in
                
                switch completion {
                case .finished:
                    exp.fulfill()
                case .failure:
                    break
                }
                
            }, receiveValue: { episode in
                
                XCTAssertEqual(episode.id, 1)
                XCTAssertEqual(episode.name, "Pilot")
                XCTAssertEqual(episode.airDate, "December 2, 2013")
                XCTAssertEqual(episode.episode, "S01E01")
                XCTAssertEqual(episode.characters, [
                    "https://rickandmortyapi.com/api/character/1",
                    "https://rickandmortyapi.com/api/character/2",
                ])
                
            })
        
        wait(for: [exp], timeout: timeoutTime)
        
        // Then
        XCTAssertNotNil(cancellable)
    }
}

extension EpisodesRepositoryImplementationUnitTest {
    
    func getEpisodeSession(statusCode: Int, endpoint: String, page: Int) -> URLSession {
        
        // URL we expect to call
        let url = URL(string: "http://jsonplaceholder.typicode.com/\(endpoint)?page=\(page)")
        
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
    
    func getEpisodeDetailSession(statusCode: Int, endpoint: String, id: Int) -> URLSession {
        
        // URL we expect to call
        let url = URL(string: "http://jsonplaceholder.typicode.com/\(endpoint)/\(id)")
        
        // data we expect to receive
        let data = getEpisodeDetailData()
        
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
                                 "air_date":"December 2, 2013",
                                 "episode":"S01E01",
                                 "characters":[
                                    "https://rickandmortyapi.com/api/character/1",
                                    "https://rickandmortyapi.com/api/character/2",
                                 ],
                                 "url":"https://rickandmortyapi.com/api/episode/1",
                                 "created":"2017-11-10T12:56:33.798Z"
                              }
                           ]
                    }
                    
                    """
        
        return Data(dataString.utf8)
    }
    
    func getEpisodeDetailData() -> Data {
        
        let dataString = """
                     { "results":
                   {
                   "id":1,
                   "name":"Pilot",
                   "air_date":"December 2, 2013",
                   "episode":"S01E01",
                   "characters":[
                   "https://rickandmortyapi.com/api/character/1",
                   "https://rickandmortyapi.com/api/character/2",
                   ],
                   "url":"https://rickandmortyapi.com/api/episode/1",
                   "created":"2017-11-10T12:56:33.798Z"
                   }
                   }
                   """
        
        return Data(dataString.utf8)
    }
}
