//
//  ConnectViewControllerTests.swift
//  Giv
//
//  Created by Akash Kejriwal on 12/14/16.
//  Copyright © 2016 Akash Kejriwal. All rights reserved.
//

import XCTest
import UIKit
@testable import Giv

class AuthViewControllerTests: XCTestCase {
    
    var testVC: AuthViewController = AuthViewController()
    let plaid_url = "https://cdn.plaid.com/link/v2/stable/link.html?isMobile=true&env=tartan&key=3e5986e00a2b17261c3384a8c3e274&clientName=Giv&webhook=https://requestb.in&longtail=true&isWebview=true&product=connect&selectAccount=true"
    
    override func setUp() {
        super.setUp()
        self.testVC = AuthViewController()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testInit() {
        XCTAssertEqual(self.testVC.containerView, nil)
    }
    
    func testGenerateLink() {
        let generated_url = self.testVC.generateLinkInitializationURL()
        let sample_url = "https://cdn.plaid.com/link/v2/stable/link.html?isMobile=true&env=tartan&key=3e5986e00a2b17261c3384a8c3e274&clientName=Giv&webhook=https://requestb.in&longtail=true&isWebview=true&product=connect&selectAccount=true" as String!
//        XCTAssertEqual(generated_url, sample_url)
        
    }
    
    func testGetUrlParams() {
        var test_dictionary = [String():String()]
//        test_dictionary = self.testVC.getUrlParams(url: plaid_url as! URL)
        
        let app_dictionary = ["selectAccount": "true", "env": "tartan", "key": "3e5986e00a2b17261c3384a8c3e274", "clientName": "Giv", "webhook": "https://requestb.in", "longtail": "true", "isWebview": "true", "isMobile": "true", "product": "connect"]
//        XCTAssertEqual(test_dictionary, app_dictionary)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
