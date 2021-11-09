//
//  RickMortyTests.swift
//  RickMortyTests
//
//  Created by Silvia España on 8/11/21.
//

import XCTest
@testable import RickMorty

class ServerCharacterResponseUnitTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        try super.tearDownWithError()
    }
    
    func testConvertToEntity() throws {
        
        // Given
        let serverCharacterResponse = ServerCharacterResponse(id: 0,
                                                              name: "name",
                                                              status: "realName",
                                                              species: "aliases",
                                                              type: "type",
                                                              gender: "gender",
                                                              origin: nil,
                                                              location: nil,
                                                              image: "image",
                                                              url: "")
        
        // When
        let character = serverCharacterResponse.converToEntity()
        
        // Then
        XCTAssertEqual(character.id, serverCharacterResponse.id)
        XCTAssertEqual(character.name, serverCharacterResponse.name)
        XCTAssertEqual(character.status, serverCharacterResponse.status)
        XCTAssertEqual(character.species, serverCharacterResponse.species)
        XCTAssertEqual(character.type, serverCharacterResponse.type)
        XCTAssertEqual(character.gender, serverCharacterResponse.gender)
        XCTAssertEqual(character.image, serverCharacterResponse.image)
        XCTAssertEqual(character.url, serverCharacterResponse.url)
        
    }
}
