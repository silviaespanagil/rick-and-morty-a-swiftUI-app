//
//  GetEpisodeUseCaseUnitTest.swift
//  RickMortyTests
//
//  Created by Silvia España on 9/11/21.
//

import XCTest
@testable import RickMorty

class GetEpisodeUseCaseUnitTest: XCTestCase {

    var sut: GetEpisodeUseCase?

    override func setUpWithError() throws {
        
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        
        sut = nil
        try super.tearDownWithError()
    }

    func testGetLocationsIsCalled() throws {
        
        // Given
        let repository = MockEpisodeRepository()
        sut = GetEpisodeUseCase(repository: repository)
        
        // When
        _ = sut!.execute()
        
        // Then
        XCTAssertTrue(repository.isGetEpisodeCalled)
    }
}
