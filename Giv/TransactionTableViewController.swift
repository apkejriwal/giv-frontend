//
//  TransactionTableViewController.swift
//  Giv
//
//  Created by Akash Kejriwal on 12/6/16.
//  Copyright © 2016 Akash Kejriwal. All rights reserved.
//

import UIKit
import Alamofire

class TransactionTableViewController: UITableViewController {
    
    var transactionNames = [String]()
    var transactionCharges = [Float]()
    var transactionSums = [Float]()
    
//    let auth = Auth()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        auth.fetchUserTransactions()
        
        transactionNames = ["Taco Bell",
                            "ABP",
                            "Entropy ",
                            "CVS",
                            "GALLO"]
        
        transactionCharges = [2.15, 2.50, 3.81, 1.91, 1.99]
        transactionSums    = [0.85, 0.50, 0.19, 0.09, 0.01]
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactionNames.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 100.0;//Choose your custom row height
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier:"TransactionViewCell", for: indexPath) as! TransactionViewCell
        
        let row = indexPath.row
        cell.transactionCompany.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.headline)
        cell.transactionCharge.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.headline)
        cell.transactionSum.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.headline)
        
        cell.transactionCompany.text = transactionNames[row]
        cell.transactionCharge.text = transactionCharges[row]
        cell.transactionSum.text = transactionSums[row]
               return cell
    }
}
