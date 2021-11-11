//
//  ViewInspector_ExampleTests.swift
//  ViewInspector-ExampleTests
//
//  Created by William Boles on 11/11/2021.
//

import XCTest
import ViewInspector

@testable import ViewInspector_Example

class ContentViewTests: XCTestCase {
    
    var sut: ContentView!
    
    // MARK: - Lifecycle
    
    override func setUpWithError() throws {
        sut = ContentView()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
}
