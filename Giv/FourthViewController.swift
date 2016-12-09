//
//  ThirdViewController.swift
//  Giv
//
//  Created by Akash Kejriwal on 12/4/16.
//  Copyright © 2016 Akash Kejriwal. All rights reserved.
//

import UIKit
import Alamofire

class FourthViewController: UIViewController {
    
    let auth = Auth()
    var finalBalance = ""
    
    @IBOutlet weak var balance: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.auth.getBalance(completion: self.renderBalance)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func renderBalance(_ balance_complete: String) {
        self.finalBalance = balance_complete
        balance.text = self.finalBalance
    }
    
    @IBAction func renderNewBalance(sender: UIButton) {
        auth.updateBalance()
        balance.text = "0.00"
    }
}
