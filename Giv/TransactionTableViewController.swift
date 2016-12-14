//
//  TransactionTableViewController.swift
//  Giv
//
//  Created by Akash Kejriwal on 12/6/16.
//  Copyright © 2016 Akash Kejriwal. All rights reserved.
//

import UIKit

extension Double {
    /// Rounds the double to decimal places value
    func roundTo(places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

class TransactionTableViewController: UITableViewController {
    
    let auth = Auth()
    var data = [[String:String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.auth.getUserTransactions(completion: self.setLists)
        tableView.backgroundView = UIImageView(image: UIImage(named: "blue_wallpaper-1"))
        
    }
    
    func setLists(_ information: [[String : String]]) {
        self.data = information
        refresh_table()
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
        return data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier:"TransactionViewCell", for: indexPath) as! TransactionViewCell
        
        let row = indexPath.row
        
        cell.layer.borderWidth = 1.5
        cell.layer.borderColor = UIColor.white.cgColor
        print(data.count)
        
        cell.transactionCompany.text = data[row]["name"]
        cell.transactionCharge.text = data[row]["amount"]
        cell.transactionSum.text = data[row]["change"]
               return cell
    }
    
    func refresh_table() {
        self.tableView.reloadData()
    }
}
