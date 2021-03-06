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
        let urlString = "https://giv-server-mksaevmwqj.now.sh/api/auth/register"
        //        let urlString = "http://128.237.214.136:3000/api/auth/register"
        
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
    
    func login(email:String, password:String) {
        //        let urlString = "http://128.237.214.136:3000/api/auth/login"
        
        let urlString = "https://giv-server-mksaevmwqj.now.sh/api/auth/login"
        
        let parameters: Parameters = [
            "email": email,
            "password": password,
            ]
        print("PARAMETERS ARE GOING IN HERE!!")
        print(parameters)
        
        Alamofire.request(urlString, method: .post, parameters: parameters).responseJSON { responseString in
            print("RESPONSE HERE")
            print(responseString)
            if let JSON = responseString.result.value {
                let JSONResponse = JSON as! NSDictionary
                let token = JSONResponse["token"]!
                PlistManager.sharedInstance.saveValue(value: token as AnyObject, forKey: "token")
            }
        }
    }
    
    func updateBalance() {
        let urlString = "https://giv-server-mksaevmwqj.now.sh/api/auth/makedonation"
        //        let urlString = "https://giv-server-aejfveskso.now.sh/api/auth/makedonation"
        Alamofire.request(urlString, method: .post, parameters: nil, encoding: URLEncoding.default)
    }
    
    
    func getUserTransactions(completion: @escaping ([[String : String]]) -> Void) {
        
        let urlString = "https://giv-server-mksaevmwqj.now.sh/api/fetchtransactions"
        //          let urlString = "http://128.237.214.136:3000/api/fetchtransactions"
        
        
        
        let headers: HTTPHeaders = [
            "Authorization": PlistManager.sharedInstance.getValueForKey(key: "token")! as! String,
            "Accept": "application/json"
        ]
        
        print("GETTING TRANSACTIONS")
        
        Alamofire.request(urlString, method: .get, parameters: nil, encoding: URLEncoding.default, headers: headers).responseJSON { response in
            if let JSON = response.result.value {
                let JSONResponse = JSON as! NSDictionary
                let list_transactions = JSONResponse["transactions"]!
                completion(list_transactions as! [[String : String]])
            }
        }
    }
    
    func getBalance(completion: @escaping (String) -> Void) {
        
        let urlString = "https://giv-server-mksaevmwqj.now.sh/api/fetchtransactions"
        //        let urlString = "http://128.237.214.136:3000/api/fetchtransactions"
        
        let headers: HTTPHeaders = [
            "Authorization": PlistManager.sharedInstance.getValueForKey(key: "token")! as! String,
            "Accept": "application/json"
        ]
        
        Alamofire.request(urlString, method: .get, parameters: nil, encoding: URLEncoding.default, headers: headers).responseJSON { response in
            if let JSON = response.result.value {
                print("success getBalance")
                let JSONResponse = JSON as! NSDictionary
                let final_balance = JSONResponse["spareChange"]!
                completion(final_balance as! String)
            }
        }
    }
    
    func getCharities(completion: @escaping ([String]) -> Void) {
        
        let urlString = "https://giv-server-mksaevmwqj.now.sh/api/listcharities"
        //        let urlString = "http://128.237.214.136:3000/api/listcharities"
        
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
    
    
    
    func connectCallback(publicToken: String) {
        let urlString = "https://giv-server-mksaevmwqj.now.sh/api/oauth/plaidconnectcallback?public_token=" + publicToken
        
        //        let urlString = "http://128.237.214.136:3000/api/oauth/plaidconnectcallback?public_token=" + publicToken
        
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
        let urlString = "https://giv-server-mksaevmwqj.now.sh/api/oauth/plaidauthcallback?public_token=" + publicToken
        
        //        let urlString = "http://128.237.214.136:3000/api/oauth/plaidauthcallback?public_token=" + publicToken
        
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
}
