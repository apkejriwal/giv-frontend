//
//  SettingsController.swift
//  Giv
//
//  Created by Akash Kejriwal on 12/4/16.
//  Copyright © 2016 Akash Kejriwal. All rights reserved.
//

import UIKit

class SettingController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logout(sender: UIButton) {
        // on logout, jwt is initialized to an empty string
        // user is then redirected to home page
        let token = "reset"
        PlistManager.sharedInstance.saveValue(value: token as AnyObject, forKey: "token")
    }
    
}
