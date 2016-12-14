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
        let sample_url = "https://cdn.plaid.com/link/v2/stable/link.html?isMobile=true&env=tartan&key=3e5986e00a2b17261c3384a8c3e274&clientName=Giv&webhook=https://requestb.in&longtail=true&isWebview=true&product=connect&selectAccount=true"
        XCTAssertEqual(generated_url, sample_url)
        
    }
    
    func testGetUrlParams() {
        var test_dictionary = [String():String()]
        test_dictionary = self.testVC.getUrlParams(url: plaid_url as! URL)
        
        let app_dictionary = ["selectAccount": "true", "env": "tartan", "key": "3e5986e00a2b17261c3384a8c3e274", "clientName": "Giv", "webhook": "https://requestb.in", "longtail": "true", "isWebview": "true", "isMobile": "true", "product": "connect"]
        XCTAssertEqual(test_dictionary, app_dictionary)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}

//import UIKit
//import WebKit
//import Alamofire
//
//class AuthViewController: UIViewController, WKNavigationDelegate {
//    
//    @IBOutlet var containerView : UIView? = nil
//    
//    let auth = Auth()
//    var webView: WKWebView!
//    
//    override func loadView() {
//        self.webView = WKWebView()
//        self.webView.navigationDelegate = self
//        self.view = webView
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        // load the link url
//        let linkUrl = generateLinkInitializationURL()
//        let url = NSURL(string: linkUrl)
//        let request = NSURLRequest(url:url! as URL)
//        self.webView.load(request as URLRequest)
//        self.webView.allowsBackForwardNavigationGestures = false
//    }
//    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    
//    // getUrlParams :: parse query parameters into a Dictionary
//    func getUrlParams(url: URL) -> Dictionary<String, String> {
//        var paramsDictionary = [String: String]()
//        let queryItems = NSURLComponents(string: (url.absoluteString))?.queryItems
//        queryItems?.forEach { paramsDictionary[$0.name] = $0.value }
//        return paramsDictionary
//    }
//    
//    // generateLinkInitializationURL :: create the link.html url with query parameters
//    func generateLinkInitializationURL() -> String {
//        let config = [
//            "key": "3e5986e00a2b17261c3384a8c3e274",
//            "product": "auth",
//            "longtail": "true",
//            "selectAccount": "true",
//            "env": "tartan",
//            "clientName": "Giv",
//            "webhook": "https://requestb.in",
//            "isMobile": "true",
//            "isWebview": "true"
//        ]
//        
//        // Build a dictionary with the Link configuration options
//        // See the Link docs (https://plaid.com/docs/link) for full documentation.
//        let components = NSURLComponents()
//        components.scheme = "https"
//        components.host = "cdn.plaid.com"
//        components.path = "/link/v2/stable/link.html"
//        components.queryItems = config.map { (NSURLQueryItem(name: $0, value: $1) as URLQueryItem) }
//        return components.string!
//    }
//    
//    func webView(_ webView: WKWebView,
//                 decidePolicyForNavigationAction navigationAction: WKNavigationAction,
//                 decisionHandler: ((WKNavigationActionPolicy) -> Void)) {
//        
//        let linkScheme = "plaidlink";
//        let actionScheme = navigationAction.request.url?.scheme;
//        let actionType = navigationAction.request.url?.host;
//        let queryParams = getUrlParams(url: navigationAction.request.url!)
//        
//        if (actionScheme == linkScheme) {
//            switch actionType {
//                
//            case "connected"?:
//                auth.authCallback(publicToken: queryParams["public_token"]!)
//                performSegue(withIdentifier: "toHome", sender: nil)
//                break
//                
//            case "exit"?:
//                
//                // Close the webview
//                self.dismiss(animated: true, completion: nil)
//                
//                break
//                
//            default:
//                break
//            }
//            decisionHandler(.cancel)
//            
//        } else if (navigationAction.navigationType == WKNavigationType.linkActivated &&
//            (actionScheme == "http" || actionScheme == "https")) {
//            // Handle http:// and https:// links inside of Plaid Link,
//            // and open them in a new Safari page. This is necessary for links
//            // such as "forgot-password" and "locked-account"
//            UIApplication.shared.openURL(navigationAction.request.url!)
//            decisionHandler(.cancel)
//        } else {
//            decisionHandler(.allow)
//        }
//    }
//}

