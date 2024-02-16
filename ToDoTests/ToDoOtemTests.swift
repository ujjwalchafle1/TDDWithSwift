//
//  ToDoOtemTests.swift
//  ToDoTests
//
//  Created by Ujjwal Chafle on 07/02/2024.
//

import XCTest
@testable import ToDo

final class ToDoOtemTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_init_whenGivenTitle_setsTitle() {
        let item = ToDoItem(title: "Dummy")
        
        XCTAssertEqual(item.title, "Dummy")
    }
    
    func test_init_whenGivenItemDescription_setsItemDescription() {
        let item = ToDoItem(title: "Foo", itemDescription: "description")
        
        XCTAssertNotNil(item.itemDescription, "description")
    }
    
    func test_init_givenTimestamp_setsTimeStamp() throws {
        let expectedTime: TimeInterval = 42.0
        let item = ToDoItem(title: "Foo", timestamp: expectedTime)
        
        let timestamp = try XCTUnwrap(item.timestamp)
        XCTAssertEqual(timestamp, expectedTime, accuracy: 0.000_001)
    }
    
    func test_init_givenLocation_setsLocation() {
        let dummyLocation = Location(name: "location")
        _ = ToDoItem(title: "title", location: dummyLocation)
        
//        XCTAssertEqual(item.location, dummyLocation)
    }
}
