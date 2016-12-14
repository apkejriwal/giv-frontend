//
//  IndexControllerTests.swift
//  Giv
//
//  Created by Akash Kejriwal on 12/14/16.
//  Copyright © 2016 Akash Kejriwal. All rights reserved.
//

import XCTest
import UIKit
@testable import Giv

class IndexControllerTests: XCTestCase {
    
    var testVC: IndexController = IndexController()

    override func setUp() {
        super.setUp()
        self.testVC = IndexController()

        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testInit() {
        XCTAssertEqual(self.testVC.finalBalance, "")
    }
    
    func testRenderBalance() {
        let value = "20.00"
        XCTAssertEqual(self.testVC.finalBalance, "")
        self.testVC.renderBalance(value)
        XCTAssertEqual(self.testVC.finalBalance, "20.00")
    }
    
    func testGenerateMessage() {
        XCTAssertEqual(self.testVC.generateMessage(),"Thank you for making a charitable donation! Your balance has been reset to $0.00")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}

