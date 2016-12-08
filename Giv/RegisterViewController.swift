//
//  RegisterViewController.swift
//  Giv
//
//  Created by Akash Kejriwal on 12/8/16.
//  Copyright © 2016 Akash Kejriwal. All rights reserved.
//

import UIKit



class RegisterViewController: UIViewController, UITextFieldDelegate {
    
    let auth = Auth()
   
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var first_name: UITextField!
    @IBOutlet weak var last_name: UITextField!
    var role = "Donor"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func switchChanged() {
        changeRole()
    }
    
    @IBAction func buttonClicked(sender: UIButton) {
        auth.createUser(first_name: first_name.text!, last_name: last_name.text!, email: email.text!, password: password.text!, role:role)
        }
    
    func changeRole() -> Void {
        if self.role == "Donor" {
            self.role = "Charity"
        } else {
            self.role = "Donor"
        }
    }

}
