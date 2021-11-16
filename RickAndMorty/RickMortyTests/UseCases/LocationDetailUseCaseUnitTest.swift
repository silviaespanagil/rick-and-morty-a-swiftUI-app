//
//  LocationDetailUseCaseUnitTest.swift
//  RickMortyTests
//
//  Created by Silvia España on 16/11/21.
//

import XCTest
@testable import RickMorty

class LocationDetailUseCaseUnitTest: XCTestCase {

    var sut: GetLocationDetailUseCase?
    
    override func setUpWithError() throws {
        
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func testGetLocationDetailIsCalled() throws {
        
        // Given
        let repository = MockLocationRepository()
        sut = GetLocationDetailUseCase(repository: repository)
        
        // When
        _ = sut!.execute(id: 1)
        
        // Then
        XCTAssertTrue(repository.isGetLocationDetailCalled)
    }
}
