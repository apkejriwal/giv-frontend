//
//  PlaidFlowViewController.swift
//  Giv
//
//  Created by Akash Kejriwal on 12/8/16.
//  Copyright © 2016 Akash Kejriwal. All rights reserved.
//

import UIKit
import Alamofire

class PlaidFlowViewController: UIViewController {
    
    let auth = Auth()
    let jwt = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        auth.fetchData()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
