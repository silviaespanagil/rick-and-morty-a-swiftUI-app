//
//  LocationRemoteDataSourceUnitTest.swift
//  RickMortyTests
//
//  Created by Silvia España on 10/11/21.
//

import XCTest
@testable import RickMorty

class LocationRemoteDataSourceUnitTest: XCTestCase {
    
    var sut: LocationRemoteDataSource?
    
    override func setUpWithError() throws {
        
        try super.setUpWithError()
        
        sut = LocationRemoteDataSource(baseURL: "http://jsonplaceholder.typicode.com/")
    }

    override func tearDownWithError() throws {
        
        sut = nil
        
        try super.tearDownWithError()
    }

    func testLocationEndpoint() {
        
        // Given
        let location = "location"
        let page = 1
        
        // When
        let response = sut!.getLocationEndpoint(page: page)
        
        // Then
        XCTAssertNotNil(response)
        XCTAssertEqual(response.url?.absoluteString.split(separator: "?").first, "http://jsonplaceholder.typicode.com/\(location)")
    }
    
    func testLocationDetailEndpoint() {
        
        // Given
        let location = "location"
        let id = 1
        
        // When
        let response = sut!.getLocationDetailEndpoint(id: id)
        
        // Then
        XCTAssertNotNil(response)
        XCTAssertEqual(response.url?.absoluteString.split(separator: "?").first, "http://jsonplaceholder.typicode.com/\(location)\(id)")
    }
}
