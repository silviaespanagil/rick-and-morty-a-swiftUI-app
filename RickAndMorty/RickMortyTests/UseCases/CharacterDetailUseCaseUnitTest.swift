//
//  CharacterDetailUseCaseUnitTest.swift
//  RickMortyTests
//
//  Created by Silvia España on 9/11/21.
//

import XCTest
@testable import RickMorty

class CharacterDetailUseCaseUnitTest: XCTestCase {

    var sut: GetCharacterDetailUseCase?
    
    override func setUpWithError() throws {
        
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func testGetCharacterDetailIsCalled() throws {
        
        // Given
        let repository = MockCharacterRepository()
        sut = GetCharacterDetailUseCase(repository: repository)
        
        // When
        _ = sut!.execute(id: 1)
        
        // Then
        XCTAssertTrue(repository.isGetCharacterDetailCalled)
    }
}
