//
//  EpisodeDetailUseCaseUnitTest.swift
//  RickMortyTests
//
//  Created by Silvia España on 16/11/21.
//

import XCTest
@testable import RickMorty

class EpisodeDetailUseCaseUnitTest: XCTestCase {

    var sut: GetEpisodeDetailUseCase?
    
    override func setUpWithError() throws {
        
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        
        sut = nil
        try super.tearDownWithError()
    }
    
    func testGetEpisodeDetailIsCalled() throws {
        
        // Given
        let repository = MockEpisodeRepository()
        sut = GetEpisodeDetailUseCase(repository: repository)
        
        // When
        _ = sut!.execute(id: 1)
        
        // Then
        XCTAssertTrue(repository.isGetEpisodeDetailCalled)
    }
}
