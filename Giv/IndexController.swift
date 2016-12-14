//
//  ThirdViewController.swift
//  Giv
//
//  Created by Akash Kejriwal on 12/4/16.
//  Copyright © 2016 Akash Kejriwal. All rights reserved.
//

import UIKit
import Alamofire

class IndexController: UIViewController {
    
    let auth = Auth()
    var finalBalance: String?
    
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
        if let finalText = self.finalBalance {
            balance.text = finalText
        }
        else {
            return
        }
    }
    
    @IBAction func renderNewBalance(sender: UIButton) {
        auth.updateBalance()
        balance.text = "0.00"
        
        let alert = UIAlertController(title: "Saved", message: generateMessage(), preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
        }))

        present(alert, animated: true, completion: nil)

    }
    
    func generateMessage() -> String {
        let message = "Thank you for making a charitable donation! Your balance has been reset to $0.00"
        return message
    }

}
