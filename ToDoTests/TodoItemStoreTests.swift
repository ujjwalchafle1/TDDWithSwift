//
//  TodoItemStoreTests.swift
//  ToDoTests
//
//  Created by Ujjwal Chafle on 16/02/2024.
//

import XCTest
@testable import ToDo
import Combine

final class TodoItemStoreTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_add_shouldPublishChange() {
        let sut = ToDoItemStore()
        
        let publisherExpectation = expectation(description: "wait for publisher in \(#file)")
        
        var receivedItems: [ToDoItem] = []
        let token = sut.itemPublisher
            .dropFirst()
            .sink { todoItems in
                receivedItems = todoItems
                publisherExpectation.fulfill()
            }
        
        let todoItem = ToDoItem(title: "Dummy")
        sut.add(todoItem)
        
        wait(for: [publisherExpectation], timeout: 1)
        token.cancel()
        XCTAssertEqual(receivedItems, [todoItem])
    }
}

extension XCTestCase {
    func wait<T: Publisher>(
        for publisher: T, 
        afterChange change: () -> Void
    ) throws -> T.Output where T.Failure == Never {
        let publisherExpectation = expectation(description: "wait for publisher in \(#file)")
        
        var result: T.Output?
        let token = publisher
            .dropFirst()
            .sink { value in
                result = value
                publisherExpectation.fulfill()
            }
        
        change()
        wait(for: [publisherExpectation], timeout: 1)
        token.cancel()
        
        let unwrappedResult = try XCTUnwrap(
            result,
            "Publisher did not publish any value"
        )
        
        return unwrappedResult
    }
}
