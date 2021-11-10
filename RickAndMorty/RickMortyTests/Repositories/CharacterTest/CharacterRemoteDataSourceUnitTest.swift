//
//  CharacterRemoteDataSourceUnitTest.swift
//  RickMortyTests
//
//  Created by Silvia España on 10/11/21.
//

import XCTest
@testable import RickMorty

class CharacterRemoteDataSourceUnitTest: XCTestCase {

    var sut: CharacterRemoteDataSource?
    
    override func setUpWithError() throws {
        
        try super.setUpWithError()
        
        sut = CharacterRemoteDataSource(baseURL: "http://jsonplaceholder.typicode.com/")
    }

    override func tearDownWithError() throws {

        sut = nil
        
        try super.tearDownWithError()
    }

    func testGetAllCharactersEndpoint() {
        
        // Given
        let character = "character"
        
        // When
        let response = sut!.getAllCharactersEndpoint()
        
        // Then
        XCTAssertNotNil(response)
        XCTAssertEqual(response.url?.absoluteString.split(separator: "?").first, "http://jsonplaceholder.typicode.com/\(character)")
    }
    
    func testGetCharacterDetailEndpoint() {
        
        // Given
        let character = "character"
        let id = 1
        
        // When
        let response = sut!.getCharacterDetailEndpoint(id: id)
        
        // Then
        XCTAssertNotNil(response)
        XCTAssertEqual(response.url?.absoluteString.split(separator: "?").first, "http://jsonplaceholder.typicode.com/\(character)\(id)")
    }
}
