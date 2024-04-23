//
//  OtherDetailItemViewUnitTests.swift
//  RickMortyTests
//
//  Created by Silvia España Gil on 23/4/24.
//

@testable import RickMorty
import XCTest
import ViewInspector

final class OtherDetailItemViewUnitTests: XCTestCase {

    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }

    func testSetup() throws {
        
        // Given
        let icon = "🤖​"
        let title = "Mr"
        let value = "Roboto"
        
        let sut = OtherDetailItemView(titleIcon: icon,
                                      title: title, 
                                      value: value)
        
        // When
        let titleIcon = try! sut.inspect().find(text: icon).string()
        let titleText = try! sut.inspect().find(text: title).string()
        let valueText = try! sut.inspect().find(text: value).string()
        
        // Then
        XCTAssertNotNil(titleIcon)
        XCTAssertNotNil(titleIcon)
        XCTAssertNotNil(valueText)
        
        XCTAssertEqual(titleIcon, icon)
        XCTAssertEqual(titleText, title)
        XCTAssertEqual(valueText, value)
        
    }
}
