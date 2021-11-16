//
//  CharacterRepositoryImplementationUnitTest.swift
//  RickMortyTests
//
//  Created by Silvia España on 9/11/21.
//

import XCTest
import Combine
@testable import RickMorty

class CharacterRepositoryImplementationUnitTest: XCTestCase {
    
    var sut: CharacterRepositoryImplementation!
    
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
    
    func testGetAllCharacterOK() throws {
        
        // Given
        let endpoint = "character"
        let page = 1
        let session = getCharacterSession(statusCode: sucessStatusCode, endpoint: endpoint, page: page)
        
        let remote = CharacterRemoteDataSource(baseURL: baseUrlString, session: session)
        
        sut = CharacterRepositoryImplementation(remoteDataSource: remote)
        
        let exp = self.expectation(description: "expected values")
        
        // When
        cancellable = sut!.getAllCharacters(page: page)
            .sink(receiveCompletion: { completion in
                
                switch completion {
                case .finished:
                    exp.fulfill()
                case .failure:
                    break
                }
                
            }, receiveValue: { character in
                
                XCTAssertEqual(character.count, 1)
                XCTAssertEqual(character.first?.id, 1)
                XCTAssertEqual(character.first?.name, "Rick")
                XCTAssertEqual(character.first?.status, "Alive")
                XCTAssertEqual(character.first?.species, "Human")
                XCTAssertEqual(character.first?.type, "Genetic experiment")
                XCTAssertEqual(character.first?.gender, "Male")
                XCTAssertEqual(character.first?.image, "character image")
                XCTAssertEqual(character.first?.url, "character url")
            })
        
        wait(for: [exp], timeout: timeoutTime)
        
        // Then
        XCTAssertNotNil(cancellable)
    }
    
    func testGetCharacterError() {
        
        // Given
        let endpoint = "character"
        let page = 1
        let session = getCharacterSession(statusCode: failureStatusCode, endpoint: endpoint, page: page)
        
        let remote = CharacterRemoteDataSource(baseURL: baseUrlString, session: session)
        
        sut = CharacterRepositoryImplementation(remoteDataSource: remote)
        
        let exp = expectation(description: "expected values")
        
        // When
        cancellable = sut!.getAllCharacters(page: page)
            .sink(receiveCompletion: { completion in
                
                switch completion {
                case .finished:
                    break
                case .failure:
                    exp.fulfill()
                }
                
            }, receiveValue: { character in
                
                //nothing
            })
        
        wait(for: [exp], timeout: timeoutTime)
        
        // Then
        XCTAssertNotNil(cancellable)
    }
    
    func testGetCharacterDetail() throws {
        
        // Given
        let endpoint = "character"
        let id = 1
        let session = getCharacterDetail(statusCode: sucessStatusCode, endpoint: endpoint, id: id)
        
        let remote = CharacterRemoteDataSource(baseURL: baseUrlString, session: session)
        
        sut = CharacterRepositoryImplementation(remoteDataSource: remote)
        
        let exp = self.expectation(description: "expected values")
        
        // When
        cancellable = sut!.getCharacterDetail(id: id)
            .sink(receiveCompletion: { completion in
                
                switch completion {
                case .finished:
                    exp.fulfill()
                case .failure:
                    break
                }
                
            }, receiveValue: { character in
                
                XCTAssertEqual(character.id, 1)
                XCTAssertEqual(character.name, "Rick Sanchez")
                XCTAssertEqual(character.status, "Alive")
                XCTAssertEqual(character.species, "Human")
                XCTAssertEqual(character.type, "")
                XCTAssertEqual(character.gender, "Male")
                XCTAssertEqual(character.image, "https://rickandmortyapi.com/api/character/avatar/1.jpeg")
                XCTAssertEqual(character.url, "https://rickandmortyapi.com/api/character/1")
            })
        
        wait(for: [exp], timeout: timeoutTime)
        
        // Then
        XCTAssertNotNil(cancellable)
    }
}

extension CharacterRepositoryImplementationUnitTest {
    
    func getCharacterSession(statusCode: Int, endpoint: String, page: Int) -> URLSession {
        
        // URL we expect to call
        let url = URL(string: "http://jsonplaceholder.typicode.com/\(endpoint)/?page=\(page)")
        
        // data we expect to receive
        let data = getCharacterData()
        
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
    
    func getCharacterDetail(statusCode: Int, endpoint: String, id: Int) -> URLSession  {
        // URL we expect to call
        let url = URL(string: "http://jsonplaceholder.typicode.com/\(endpoint)/\(id)")
        
        // data we expect to receive
        let data = getCharacterDetailData()
        
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
    
    func getCharacterData() -> Data {
        
        let dataString = """
                    
                    {
                        "results":[
                            {
                                "id": 1,
                                "name": "Rick",
                                "status": "Alive",
                                "species": "Human",
                                "type": "Genetic experiment",
                                "gender": "Male",
                                "image": "character image",
                                "origin": {
                                    "name": "Earth (C-137)",
                                    "url": "origin url"
                                },
                                "location": {
                                    "name": "Citadel of Ricks",
                                    "url": "location url"
                                },
                                "url": "character url"
                            }
                        ]
                    }
                    
                    """
        
        return Data(dataString.utf8)
    }
    
    func getCharacterDetailData() -> Data {
        
        let dataString = """
                    
                    {
                       "id":1,
                       "name":"Rick Sanchez",
                       "status":"Alive",
                       "species":"Human",
                       "type":"",
                       "gender":"Male",
                       "origin":{
                          "name":"Earth (C-137)",
                          "url":"https://rickandmortyapi.com/api/location/1"
                       },
                       "location":{
                          "name":"Citadel of Ricks",
                          "url":"https://rickandmortyapi.com/api/location/3"
                       },
                       "image":"https://rickandmortyapi.com/api/character/avatar/1.jpeg",
                       "url":"https://rickandmortyapi.com/api/character/1",
                       "created":"2017-11-04T18:48:46.250Z"
                    }
                    
                    """
        
        return Data(dataString.utf8)
    }
}
