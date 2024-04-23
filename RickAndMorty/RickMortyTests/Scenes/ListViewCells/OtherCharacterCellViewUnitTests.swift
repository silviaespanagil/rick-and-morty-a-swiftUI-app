//
//  OtherCharacterCellViewUnitTests.swift
//  RickMortyTests
//
//  Created by Silvia España Gil on 23/4/24.
//

@testable import RickMorty
import XCTest
import ViewInspector

final class OtherCharacterCellViewUnitTests: XCTestCase {
    
    override func setUpWithError() throws {
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
    
    func testSetup() throws {
        
        // Given
        let image = "https://icons.iconarchive.com/icons/iconarchive/cute-animal/256/Cute-Cat-icon.png"
        let name = "Rick"
        let titleA = "Been in"
        let subtitleA = "51 episodes"
        let titleB = "Current status"
        let subtitleB = "Alive"
        
        let sut = OtherCharacterCellView(image: image,
                                         name: name,
                                         titleA: titleA,
                                         subtitleA: subtitleA,
                                         titleB: titleB,
                                         subtitleB: subtitleB)
        
        // When
        let characterImage = try! sut.inspect().find(RenderImage.self).actualView()
        let nameText = try! sut.inspect().find(text: name).string()
        let titleAText = try! sut.inspect().find(text: titleA).string()
        let subtitleAText = try! sut.inspect().find(text: subtitleA).string()
        let titleBText = try! sut.inspect().find(text: titleB).string()
        let subtitleBText = try! sut.inspect().find(text: subtitleB).string()
        
        // Then
        XCTAssertNotNil(characterImage)
        XCTAssertNotNil(nameText)
        XCTAssertNotNil(titleAText)
        XCTAssertNotNil(subtitleAText)
        XCTAssertNotNil(titleBText)
        XCTAssertNotNil(subtitleBText)
        
        XCTAssertEqual(nameText, name)
        XCTAssertEqual(titleAText, titleA)
        XCTAssertEqual(subtitleAText, subtitleA)
        XCTAssertEqual(titleBText, titleB)
        XCTAssertEqual(subtitleBText, subtitleB)
    }
}
