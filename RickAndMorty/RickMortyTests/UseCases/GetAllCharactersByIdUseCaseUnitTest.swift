//
//  GetAllCharactersByIdUseCaseUnitTest.swift
//  RickMortyTests
//
//  Created by Silvia España on 16/11/21.
//

import XCTest
@testable import RickMorty

class GetAllCharactersByIdUseCaseUnitTest: XCTestCase {

    var sut: GetAllCharactersByIdUseCase?
    
    override func setUpWithError() throws {
        
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func testGetAllCharactersByIdIsCalled() throws {
        
        // Given
        let repository = MockCharacterRepository()
        let ids = [1,2]
        sut = GetAllCharactersByIdUseCase(repository: repository)
        
        // When
        _ = sut!.execute(ids: ids)
        
        // Then
        XCTAssertTrue(repository.isgetAllCharactersByIdCalled)
    }
}
