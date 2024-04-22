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
                                                              status: "unknown",
                                                              species: "aliases",
                                                              type: "unknown",
                                                              gender: "gender",
                                                              origin: nil,
                                                              location: nil,
                                                              image: "image",
                                                              url: "",
                                                              episode: [""])
        
        // When
        let character = serverCharacterResponse.converToEntity()
        
        // Then
        XCTAssertEqual(character.id, serverCharacterResponse.id)
        XCTAssertEqual(character.name, serverCharacterResponse.name)
        XCTAssertEqual(character.status.rawValue, serverCharacterResponse.status.capitalizingFirstLetter())
        XCTAssertEqual(character.species, serverCharacterResponse.species)
        XCTAssertEqual(character.type, serverCharacterResponse.type.capitalizingFirstLetter())
        XCTAssertEqual(character.gender, serverCharacterResponse.gender.capitalizingFirstLetter())
        XCTAssertEqual(character.image, serverCharacterResponse.image)
        XCTAssertEqual(character.url, serverCharacterResponse.url)
    }
}
