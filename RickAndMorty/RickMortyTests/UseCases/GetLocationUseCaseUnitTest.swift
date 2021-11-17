//
//  GetLocationUseCaseUnitTest.swift
//  RickMortyTests
//
//  Created by Silvia España on 9/11/21.
//

import XCTest
@testable import RickMorty

class GetLocationUseCaseUnitTest: XCTestCase {
    
    var sut: GetLocationUseCase?

    override func setUpWithError() throws {
        
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        
        sut = nil
        try super.tearDownWithError()
    }

    func testGetLocationsIsCalled() throws {
        
        // Given
        let repository = MockLocationRepository()
        let page = 1
        sut = GetLocationUseCase(repository: repository)
        
        // When
        _ = sut!.execute(page: page)
        
        // Then
        XCTAssertTrue(repository.isGetLocationCalled)
    }
}

