//
//  continuous_integrationTests.swift
//  continuous_integrationTests
//
//  Created by Bruno Vieira on 16/05/19.
//  Copyright © 2019 Bruno Vieira. All rights reserved.
//

import XCTest
@testable import continuous_integration

class continuous_integrationTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSuccess() {
        let viewController = ViewController()
        let response = viewController.bigger10(value: 50)
        XCTAssertTrue(response)
    }
    
    func testFailure() {
        let viewController = ViewController()
        let response = viewController.bigger10(value: 5)
        XCTAssertFalse(response)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
