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
    func fetchData() {
        
        let urlString = "http://128.237.162.142:3000/api/auth/register"
        
        let parameters: Parameters = [
            "email": "vikas@kejriwal.com",
            "password": "test",
            "firstName": "Akash",
            "lastName" : "Kejriwal"
        ]

        Alamofire.request(urlString, method: .post, parameters: parameters, encoding: URLEncoding.default).responseJSON { response in
            print(response.request)  // original URL request
            print(response.response) // HTTP URL response
            print(response.data)     // server data
            print(response.result)   // result of response serialization
            print("response jwt token")
//            print(response.result.token)
            
            if let JSON = response.result.value {
                print("JSON: \(JSON)")
            }
        }
        
        
//        response { response in
//            if let error = response.error {
//                print("Error fetching repositories: \(error)")
//                completion(response.data)
//                return
//            }
//            completion(response.data)
//        }
        
//            .responseJSON { (response:DataResponse<Any>) in
//            switch(response.result) {
//            case .success(_):
//                if let data = response.result.value{
//                    print(response.result.value)
//                }
//                break
//                
//            case .failure(_):
//                print(response.result.error)
//                break
//                
//            }
        }
        
    }
