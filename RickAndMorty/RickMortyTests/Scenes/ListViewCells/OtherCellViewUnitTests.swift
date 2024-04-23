//
//  OtherCellViewUnitTests.swift
//  RickMortyTests
//
//  Created by Silvia España Gil on 23/4/24.
//

@testable import RickMorty
import XCTest
import ViewInspector

final class OtherCellViewUnitTests: XCTestCase {
    
    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }

    func testSetup() throws {
        
        // Given
        let name = "Pilot"
        let infoA = "S01E01"
        let infoBName = "Air date"
        let infoB = "December 02"
        let infoBString = "\(infoBName): \(infoB)"
        
        let sut = OtherCellView(name: name,
                                infoA: infoA,
                                infoBName: infoBName,
                                infoB: infoB)
        
        // When
        let nameText = try! sut.inspect().find(text: name).string()
        let infoText = try! sut.inspect().find(text: infoA).string()
        let infoBInformation = try! sut.inspect().find(text: infoBString).string()
        
        // Then
        XCTAssertNotNil(nameText)
        XCTAssertNotNil(infoText)
        XCTAssertNotNil(infoBInformation)
        
        XCTAssertEqual(nameText, name)
        XCTAssertEqual(infoText, infoA)
        XCTAssertEqual(infoBInformation, infoBString)
    }
}
