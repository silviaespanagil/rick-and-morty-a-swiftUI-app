//
//  ProgressViewViewUnitTests.swift
//  RickMortyTests
//
//  Created by Silvia España Gil on 23/4/24.
//

@testable import RickMorty
import XCTest
import ViewInspector

final class ProgressViewViewUnitTests: XCTestCase {

    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }

    func testSetup() throws {
        
        // Given
        let sut = ProgressViewView()
        
        // When
        let loader = try! sut.inspect().find(viewWithId: "loader")
        
        // Then
        XCTAssertNotNil(loader)
    }
}
