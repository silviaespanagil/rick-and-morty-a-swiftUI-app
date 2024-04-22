//
//  ServerLocationResponseUnitTest.swift
//  RickMortyTests
//
//  Created by Silvia España on 9/11/21.
//

import XCTest
@testable import RickMorty

class ServerLocationResponseUnitTest: XCTestCase {
    
    override func setUpWithError() throws {
        
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        
        try super.tearDownWithError()
    }
    
    func testLocationConvertToEntity() throws {
        
        // Given
        let serverLocationResponse = ServerGetLocationResponse(id: 1,
                                                               name: "name",
                                                               type: "type",
                                                               residents: [],
                                                               dimension: "dimension")
        
        // When
        let location = serverLocationResponse.converToEntity()
        
        // Then
        XCTAssertEqual(location.id, serverLocationResponse.id)
        XCTAssertEqual(location.name, serverLocationResponse.name.capitalizingFirstLetter())
        XCTAssertEqual(location.type, serverLocationResponse.type.capitalizingFirstLetter())
        XCTAssertEqual(location.dimension, serverLocationResponse.dimension.capitalizingFirstLetter())
    }
}
