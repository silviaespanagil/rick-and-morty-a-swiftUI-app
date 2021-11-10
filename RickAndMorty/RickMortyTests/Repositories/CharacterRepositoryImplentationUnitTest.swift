//
//  CharacterRepositoryImplentationUnitTest.swift
//  RickMortyTests
//
//  Created by Silvia España on 10/11/21.
//

import XCTest
import SwiftUI
import Combine
@testable import RickMorty


class CharacterRepositoryImplementationUnitTest: XCTestCase {
    
    var sut: CharacterRepositoryImplementation!
    
    var cancellable: AnyCancellable?
    
    let baseUrlString = "http://jsonplaceholder.typicode.com/"
    
    let successStatusCode = 200
    let failureStatusCode = 401
    let timeoutTime: TimeInterval = 2
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
   
        sut = nil
        try super.tearDownWithError()
    }
    
    func testGetCharacterOK() {

        // Given
        let session = getCharacterSession(statusCode: successStatusCode)
        
        let remote = CharacterRemoteDataSource(baseURL: baseUrlString, session: session)
        
        sut = CharacterRepositoryImplementation(remoteDataSource: remote)
        
        let exp = expectation(description: "expected values")
        
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
                
                XCTAssertEqual(character.first?.name, "Rick")

            })
        
        wait(for: [exp], timeout: timeoutTime)
        
        // Then
        XCTAssertNotNil(cancellable)
    }
}

extension CharacterRepositoryImplementationUnitTest {
    
    func getCharacterSession(statusCode: Int) -> URLSession {
        
        // URL we expect to call
        let url = URL(string: "http://jsonplaceholder.typicode.com/character")
        
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
    
    func getCharacterData() -> Data {
        
        let dataString = """
                                {
                                "results": [{
                                    "name": "Rick",
                                    
                                }
                    ]                                }
                    """

        return Data(dataString.utf8)
    }
}
