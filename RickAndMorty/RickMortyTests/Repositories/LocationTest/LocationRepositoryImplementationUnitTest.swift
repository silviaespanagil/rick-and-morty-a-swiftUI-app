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
    
    func testGetAllLocationOK() throws {
        
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
    
    func testGetAllLocationError() throws {
        
        // Given
        let endpoint = "location"
        let session = getLocationSession(statusCode: failureStatusCode, endpoint: endpoint)
        
        let remote = LocationRemoteDataSource(baseURL: baseUrlString, session: session)
        
        sut = LocationRepositoryImplementation(remoteDataSource: remote)
        
        let exp = self.expectation(description: "expected values")
        
        // When
        cancellable = sut!.getLocation()
            .sink(receiveCompletion: { completion in
                
                switch completion {
                case .finished:
                    break
                case .failure:
                    exp.fulfill()
                }
                
            }, receiveValue: { location in
                
                // Nothing
            })
        
        wait(for: [exp], timeout: timeoutTime)
        
        // Then
        XCTAssertNotNil(cancellable)
    }
    
    func testGetLocationDetail() throws {
        //TODO: Not passing
        
        // Given
        let endpoint = "location"
        let id = 1
        let session = getLocationDetailSession(statusCode: sucessStatusCode, endpoint: endpoint, id: id)
        
        let remote = LocationRemoteDataSource(baseURL: baseUrlString, session: session)
        
        sut = LocationRepositoryImplementation(remoteDataSource: remote)
        
        let exp = self.expectation(description: "expected values")
        
        // When
        cancellable = sut!.getLocationDetail(id: id)
            .sink(receiveCompletion: { completion in
                
                switch completion {
                case .finished:
                    exp.fulfill()
                case .failure:
                    break
                }
                
            }, receiveValue: { location in
                
                XCTAssertEqual(location.id, 1)
                XCTAssertEqual(location.name, "Earth (C-137)")
                XCTAssertEqual(location.type, "Planet")
                XCTAssertEqual(location.dimension, "Dimension C-137")
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
    
    func getLocationDetailSession(statusCode: Int, endpoint: String, id: Int) -> URLSession {
        
        // URL we expect to call
        let url = URL(string: "http://jsonplaceholder.typicode.com/\(endpoint)/\(id)")
        
        // data we expect to receive
        let data = getLocationDetailData()
        
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
                                 ],
                                 "url":"https://rickandmortyapi.com/api/location/1",
                                 "created":"2017-11-10T12:42:04.162Z"
                              }
                           ]
                    }
                    
                    """
        
        return Data(dataString.utf8)
    }
    
    func getLocationDetailData() -> Data {
        
        let dataString = """
                    {
                       "id":1,
                       "name":"Earth (C-137)",
                       "type":"Planet",
                       "dimension":"Dimension C-137",
                       "residents":[
                          "https://rickandmortyapi.com/api/character/38",
                          "https://rickandmortyapi.com/api/character/45",
                       ],
                       "url":"https://rickandmortyapi.com/api/location/1",
                       "created":"2017-11-10T12:42:04.162Z"
                    }
                    """
        
        return Data(dataString.utf8)
    }
}
