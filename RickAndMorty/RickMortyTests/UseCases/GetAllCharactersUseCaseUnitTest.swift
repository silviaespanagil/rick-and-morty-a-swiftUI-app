//
//  GetAllCharactersUseCaseUnitTest.swift
//  RickMortyTests
//
//  Created by Silvia España on 9/11/21.
//

import XCTest
@testable import RickMorty

class GetAllCharactersUseCaseUnitTest: XCTestCase {
    
    var sut: GetAllCharactersUseCase?
    
    override func setUpWithError() throws {
        
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func testGetAllCharactersIsCalled() throws {
        
        // Given
        let repository = MockCharacterRepository()
        sut = GetAllCharactersUseCase(repository: repository)
        
        // When
        _ = sut!.execute()
        
        // Then
        XCTAssertTrue(repository.isGetAllCharactersCalled)
    }
}
