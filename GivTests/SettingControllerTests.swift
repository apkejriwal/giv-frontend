//
//  SettingControllerTests.swift
//  Giv
//
//  Created by Akash Kejriwal on 12/14/16.
//  Copyright © 2016 Akash Kejriwal. All rights reserved.
//

import XCTest
import UIKit
@testable import Giv

class SettingControllerTests: XCTestCase {
    
    var testVC: SettingController = SettingController()

    override func setUp() {
        super.setUp()
        self.testVC = SettingController()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
