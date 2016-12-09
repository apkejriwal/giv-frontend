//
//  auth.swift
//  Giv
//
//  Created by Akash Kejriwal on 12/7/16.
//  Copyright © 2016 Akash Kejriwal. All rights reserved.
//
import Foundation
import Alamofire
class Auth {
    
    func createUser(first_name: String, last_name:String, email:String, password:String, role:String ) {
        let urlString = "http://128.237.165.19:3000/api/auth/register"
        
        let parameters: Parameters = [
            "email": email,
            "password": password,
            "firstName": first_name,
            "lastName" : last_name,
            "role" : role
        ]
        
        Alamofire.request(urlString, method: .post, parameters: parameters, encoding: URLEncoding.default).responseJSON { response in
            if let JSON = response.result.value {
                let JSONResponse = JSON as! NSDictionary
                let token = JSONResponse["token"]!
                PlistManager.sharedInstance.saveValue(value: token as AnyObject, forKey: "token")
            }
        }
    }
    func getUserTransactions() {
        
        let urlString = ""
        
        let headers: HTTPHeaders = [
            "Authorization": PlistManager.sharedInstance.getValueForKey(key: "token")! as! String,
            "Accept": "application/json"
        ]
        
        Alamofire.request(urlString, method: .get, parameters: nil, encoding: URLEncoding.default, headers: headers).responseJSON { response in
            if let JSON = response.result.value {
                print("success json transactions")
                let JSONResponse = JSON as! NSDictionary
                print("JSON BELOW transactions")
                print(JSON)
            }
        }
    }
    
    func login(email:String, password:String) {
        let urlString = "http://128.237.165.19:3000/api/auth/login"
        
        let parameters: Parameters = [
            "email": email,
            "password": password,
            ]
        
        Alamofire.request(urlString, method: .post, parameters: parameters, encoding: URLEncoding.default).responseJSON { response in
            if let JSON = response.result.value {
                let JSONResponse = JSON as! NSDictionary
                let token = JSONResponse["token"]!
                //                print("jtw token login")
                //                print(token)
                PlistManager.sharedInstance.saveValue(value: token as AnyObject, forKey: "token")
            }
        }
    }
    
    func connectCallback(publicToken: String) {
        let urlString = "http://128.237.165.19:3000/api/oauth/plaidconnectcallback?public_token=" + publicToken
        let headers: HTTPHeaders = [
            "Authorization": PlistManager.sharedInstance.getValueForKey(key: "token")! as! String,
            "Accept": "application/json"
        ]
        Alamofire.request(urlString, method: .post, encoding: URLEncoding.default, headers: headers).responseJSON { response in
            if let JSON = response.result.value {
                let JSONResponse = JSON as! NSDictionary
                let outcome = JSONResponse["result"]!
                print("outcome connectCallback")
                print(outcome)
            }
        }
    }
    
    func authCallback(publicToken: String) {
        let urlString = "http://128.237.165.19:3000/api/oauth/plaidauthcallback?public_token=" + publicToken
        let headers: HTTPHeaders = [
            "Authorization": PlistManager.sharedInstance.getValueForKey(key: "token")! as! String,
            "Accept": "application/json"
        ]
        Alamofire.request(urlString, method: .post, encoding: URLEncoding.default, headers: headers).responseJSON { response in
            if let JSON = response.result.value {
                let JSONResponse = JSON as! NSDictionary
                let outcome = JSONResponse["result"]!
                print("outcome authCallBack")
                print(outcome)
            }
        }
    }
    
    func getCharities(completion: @escaping ([String]) -> Void) {
        
        let urlString = "http://128.237.165.19:3000/api/listcharities"
        
        let headers: HTTPHeaders = [
            "Authorization": PlistManager.sharedInstance.getValueForKey(key: "token")! as! String,
            "Accept": "application/json"
        ]
        
        Alamofire.request(urlString, method: .get, parameters: nil, encoding: URLEncoding.default, headers: headers).responseJSON { response in
            if let JSON = response.result.value {
                let JSONResponse = JSON as! NSDictionary
                let list_charities = JSONResponse["charities"]!
                completion((list_charities as! [String]))
            }
        }
    }
}
