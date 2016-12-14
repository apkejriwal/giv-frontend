//
//  LoginViewControllerTests.swift
//  Giv
//
//  Created by Akash Kejriwal on 12/14/16.
//  Copyright © 2016 Akash Kejriwal. All rights reserved.
//

import XCTest
import UIKit
@testable import Giv


class LoginViewControllerTests: XCTestCase {
    
    var testVC: LoginViewController = LoginViewController()
    
    override func setUp() {
        super.setUp()
        self.testVC = LoginViewController()

        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testInit() {
        XCTAssertEqual(self.testVC.email,nil)
        XCTAssertEqual(self.testVC.password, nil)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}


