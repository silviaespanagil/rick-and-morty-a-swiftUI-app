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
    
    let baseUrlString = "https://rickandmortyapi.com/api/"
    
    let sucessStatusCode = 200
    let failureStatusCode = 401
    let timeoutTime: TimeInterval = 2
    
    override func setUpWithError() throws {
        
        try super.setUpWithError()
        sut = CharacterRepositoryImplementation()
    }

    override func tearDownWithError() throws {
        
        sut = nil
        try super.tearDownWithError()
    }

    func testGetAllCharacterOK() throws {
        
        // Given
        let endpoint = "character"
        let session = getCharacterSession(statusCode: sucessStatusCode, endpoint: endpoint)
        
        let remote = CharacterRemoteDataSource(baseURL: baseUrlString, session: session)
        
        sut = CharacterRepositoryImplementation(remoteDataSource: remote)
        
        let exp = self.expectation(description: "expected values")
        
        // When
        cancellable = sut!.getAllCharacters()
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
                XCTAssertEqual(character.first?.name, "name")
                XCTAssertEqual(character.first?.status, "status")
                XCTAssertEqual(character.first?.species, "species")
                XCTAssertEqual(character.first?.type, "type")
                XCTAssertEqual(character.first?.gender, "gender")
                XCTAssertEqual(character.first?.origin, "origin")
                XCTAssertEqual(character.first?.location, "location")
                XCTAssertEqual(character.first?.image, "image")
                XCTAssertEqual(character.first?.url, "url")
            })
        
        wait(for: [exp], timeout: 30)
        
        // Then
        XCTAssertNotNil(cancellable)
        
    }
}

extension CharacterRepositoryImplementationUnitTest {
    
    func getCharacterSession(statusCode: Int, endpoint: String) -> URLSession {
        
        // URL we expect to call
        let url = URL(string: "https://rickandmortyapi.com/api/\(endpoint)")
        
        // data we expect to receive
        let data = getCharacterData()
        
        // attach that to some fixed data in our protocol handler
        URLProtocolMock.testURLs = [url: data]
        URLProtocolMock.response = HTTPURLResponse(url: URL(string: "https://rickandmortyapi.com:8080")!,
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
                                "results": [{
                                    "id": 1 ,
                                    "name": "name",
                                    "status": "status",
                                    "species": "species",
                                    "type": "type",
                                    "gender": "gender",
                                    "origin": "origin",
                                    "location": "location",
                                    "image": "image",
                                    "url": "url"
                                }]
                                }
                    """

        return Data(dataString.utf8)
    }
}
