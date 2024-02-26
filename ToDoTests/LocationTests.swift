//
//  LocationTests.swift
//  ToDoTests
//
//  Created by Ujjwal Chafle on 09/02/2024.
//

import XCTest
@testable import ToDo

final class LocationTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_init_givenCoordinates_setsCoordinates() throws {
        let coordinates = Coordinates(latitude: 1, longitude: 2)
        
        let location = Location(name: "", coordinates: coordinates)
        
        let resultCoordinates = try XCTUnwrap(location.coordinates)
        XCTAssertEqual(resultCoordinates.longitude, 2)
        XCTAssertEqual(resultCoordinates.latitude, 1)
    }
    
    func test_init_givenName_setsName() {
        let item = Location(name: "nagpur")
        
        XCTAssertEqual(item.name, "nagpur")
    }
}
