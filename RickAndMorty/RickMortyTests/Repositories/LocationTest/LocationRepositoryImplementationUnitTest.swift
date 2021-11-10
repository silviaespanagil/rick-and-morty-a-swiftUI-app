//
//  LocationRepositoryImplementationUnitTest.swift
//  RickMortyTests
//
//  Created by Silvia España on 10/11/21.
//

import XCTest
import Combine
@testable import RickMorty

class LocationRepositoryImplementationUnitTest: XCTestCase {
    
    var sut: LocationRepositoryImplementation!
    
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
        let endpoint = "location"
        let session = getLocationSession(statusCode: sucessStatusCode, endpoint: endpoint)
        
        let remote = LocationRemoteDataSource(baseURL: baseUrlString, session: session)
        
        sut = LocationRepositoryImplementation(remoteDataSource: remote)
        
        let exp = self.expectation(description: "expected values")
        
        // When
        cancellable = sut!.getLocation()
            .sink(receiveCompletion: { completion in
                
                switch completion {
                case .finished:
                    exp.fulfill()
                case .failure:
                    break
                }
                
            }, receiveValue: { location in
                
                XCTAssertEqual(location.count, 1)
                XCTAssertEqual(location.first?.id, 1)
                XCTAssertEqual(location.first?.name, "Earth (C-137)")
                XCTAssertEqual(location.first?.type, "Planet")
                XCTAssertEqual(location.first?.dimension, "Dimension C-137")
            })
        
        wait(for: [exp], timeout: timeoutTime)
        
        // Then
        XCTAssertNotNil(cancellable)
    }
}

extension LocationRepositoryImplementationUnitTest {
    
    func getLocationSession(statusCode: Int, endpoint: String) -> URLSession {
        
        // URL we expect to call
        let url = URL(string: "http://jsonplaceholder.typicode.com/\(endpoint)")
        
        // data we expect to receive
        let data = getLocationData()
        
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
    
    func getLocationData() -> Data {
        
        let dataString = """
                    
                    {
                        "results":[
                              {
                                 "id":1,
                                 "name":"Earth (C-137)",
                                 "type":"Planet",
                                 "dimension":"Dimension C-137",
                                 "residents":[
                                    "https://rickandmortyapi.com/api/character/38",
                                    "https://rickandmortyapi.com/api/character/45",
                                    "https://rickandmortyapi.com/api/character/71",
                                    "https://rickandmortyapi.com/api/character/82",
                                    "https://rickandmortyapi.com/api/character/83",
                                    "https://rickandmortyapi.com/api/character/92",
                                    "https://rickandmortyapi.com/api/character/112",
                                    "https://rickandmortyapi.com/api/character/114",
                                    "https://rickandmortyapi.com/api/character/116",
                                    "https://rickandmortyapi.com/api/character/117",
                                    "https://rickandmortyapi.com/api/character/120",
                                    "https://rickandmortyapi.com/api/character/127",
                                    "https://rickandmortyapi.com/api/character/155",
                                    "https://rickandmortyapi.com/api/character/169",
                                    "https://rickandmortyapi.com/api/character/175",
                                    "https://rickandmortyapi.com/api/character/179",
                                    "https://rickandmortyapi.com/api/character/186",
                                    "https://rickandmortyapi.com/api/character/201",
                                    "https://rickandmortyapi.com/api/character/216",
                                    "https://rickandmortyapi.com/api/character/239",
                                    "https://rickandmortyapi.com/api/character/271",
                                    "https://rickandmortyapi.com/api/character/302",
                                    "https://rickandmortyapi.com/api/character/303",
                                    "https://rickandmortyapi.com/api/character/338",
                                    "https://rickandmortyapi.com/api/character/343",
                                    "https://rickandmortyapi.com/api/character/356",
                                    "https://rickandmortyapi.com/api/character/394"
                                 ],
                                 "url":"https://rickandmortyapi.com/api/location/1",
                                 "created":"2017-11-10T12:42:04.162Z"
                              }
                           ]
                    }
                    
                    """

        return Data(dataString.utf8)
    }
}
