//
//  ViewInspector_ExampleTests.swift
//  ViewInspector-ExampleTests
//
//  Created by William Boles on 11/11/2021.
//

import XCTest
import ViewInspector
import SwiftUI

@testable import ViewInspector_Example

extension ContentView: Inspectable { }

class ContentViewTests: XCTestCase {
    
    // MARK: - Tests

    func test_labelHasValue() throws {
        let sut = ContentView()
        let value = try sut.inspect().text().string()
        XCTAssertEqual(value, "Hello, world!")
    }
}
