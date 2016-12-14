import UIKit
import WebKit
import Alamofire

class ConnectViewController: UIViewController, WKNavigationDelegate {
    
    @IBOutlet var containerView : UIView? = nil
    
    let auth = Auth()
    var webView: WKWebView!
    
    override func loadView() {
        self.webView = WKWebView()
        self.webView.navigationDelegate = self
        self.view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
              
        // load the link url
        let linkUrl = generateLinkInitializationURL()
        let url = NSURL(string: linkUrl)
        let request = NSURLRequest(url:url! as URL)
        self.webView.load(request as URLRequest)
        self.webView.allowsBackForwardNavigationGestures = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // getUrlParams :: parse query parameters into a Dictionary
    func getUrlParams(url: URL) -> Dictionary<String, String> {
        var paramsDictionary = [String: String]()
        let queryItems = NSURLComponents(string: (url.absoluteString))?.queryItems
        queryItems?.forEach { paramsDictionary[$0.name] = $0.value }
        return paramsDictionary
    }
    
    // generateLinkInitializationURL :: create the link.html url with query parameters
    func generateLinkInitializationURL() -> String {
        let config = [
            "key": "3e5986e00a2b17261c3384a8c3e274",
            "product": "connect",
            "longtail": "true",
            "selectAccount": "true",
            "env": "tartan",
            "clientName": "Giv",
            "webhook": "https://requestb.in",
            "isMobile": "true",
            "isWebview": "true"
        ]
        
        // Build a dictionary with the Link configuration options
        // See the Link docs (https://plaid.com/docs/link) for full documentation.
        let components = NSURLComponents()
        components.scheme = "https"
        components.host = "cdn.plaid.com"
        components.path = "/link/v2/stable/link.html"
        components.queryItems = config.map { (NSURLQueryItem(name: $0, value: $1) as URLQueryItem) }
        return components.string!
    }
    
    func webView(_ webView: WKWebView,
                 decidePolicyForNavigationAction navigationAction: WKNavigationAction,
                 decisionHandler: ((WKNavigationActionPolicy) -> Void)) {
        
        let linkScheme = "plaidlink";
        let actionScheme = navigationAction.request.url?.scheme;
        let actionType = navigationAction.request.url?.host;
        let queryParams = getUrlParams(url: navigationAction.request.url!)
        
        if (actionScheme == linkScheme) {
            switch actionType {
            case "connected"?:
                
                auth.connectCallback(publicToken: queryParams["public_token"]!)
                performSegue(withIdentifier: "toAuthorize", sender: nil)
                
                
                // Parse data passed from Link into a dictionary
                // This includes the public_token as well as account and institution metadata
                print("Public Token: \(queryParams["public_token"])");
                print("Account ID: \(queryParams["account_id"])");
                print("Institution type: \(queryParams["institution_type"])");
                print("Institution name: \(queryParams["institution_name"])");
                break
            case "exit"?:
                // Close the webview
                
                print("before segue inside linkview")
                
                
                
//                vc.resultsArray = self.resultsArray
                
                // Parse data passed from Link into a dictionary
                // This includes information about where the user was in the Link flow
                // any errors that occurred, and request IDs
                print("URL: \(navigationAction.request.url?.absoluteString)")
                // Output data from Link
                print("User status in flow: \(queryParams["status"])");
                // The requet ID keys may or may not exist depending on when the user exited
                // the Link flow.
                print("Link request ID: \(queryParams["link_request_id"])");
                print("Plaid API request ID: \(queryParams["link_request_id"])");
                
                self.dismiss(animated: true, completion: nil)

                break
                
            default:
                print("Link action detected: \(actionType)")
                break
            }
            
            decisionHandler(.cancel)
        } else if (navigationAction.navigationType == WKNavigationType.linkActivated &&
            (actionScheme == "http" || actionScheme == "https")) {
            // Handle http:// and https:// links inside of Plaid Link,
            // and open them in a new Safari page. This is necessary for links
            // such as "forgot-password" and "locked-account"
            UIApplication.shared.openURL(navigationAction.request.url!)
            decisionHandler(.cancel)
        } else {
            print("Unrecognized URL scheme detected that is neither HTTP, HTTPS, or related to Plaid Link: \(navigationAction.request.url?.absoluteString)");
            decisionHandler(.allow)
        }
    }
}
