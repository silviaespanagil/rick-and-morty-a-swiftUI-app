//
//  CharacterCellViewUnitTests.swift
//  RickMortyTests
//
//  Created by Silvia España Gil on 23/4/24.
//

@testable import RickMorty
import XCTest
import ViewInspector

final class CharacterCellViewUnitTests: XCTestCase {

    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }

    func testSetup() throws {
        
        // Given
        let name = "Rick"
        let status = "Alive"
        let image = "https://icons.iconarchive.com/icons/iconarchive/cute-animal/256/Cute-Cat-icon.png"
        
        let sut = CharacterCellView(image: image,
                                    name: name,
                                    status: status)
        
        // When
        let characterImage = try! sut.inspect().find(RenderImage.self).actualView()
        let nameText = try! sut.inspect().find(text: name).string()
        let statusText = try! sut.inspect().find(text: status).string()
        
        // Then
        XCTAssertNotNil(characterImage)
        XCTAssertNotNil(nameText)
        XCTAssertNotNil(status)
        
        XCTAssertEqual(nameText, name)
        XCTAssertEqual(statusText, status)
        
    }
}
