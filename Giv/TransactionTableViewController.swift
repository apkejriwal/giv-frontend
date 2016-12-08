//
//  TransactionTableViewController.swift
//  Giv
//
//  Created by Akash Kejriwal on 12/6/16.
//  Copyright © 2016 Akash Kejriwal. All rights reserved.
//

import UIKit

class TransactionTableViewController: UITableViewController {
    
    var attractionNames = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        attractionNames = ["Buckingham Palace",
                           "The Eiffel Tower",
                           "The Grand Canyon",
                           "Windsor Castle",
                           "Empire State Building"]
        
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
        return attractionNames.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell =
            self.tableView.dequeueReusableCell(withIdentifier:
                "TransactionViewCell", for: indexPath)
                as! TransactionViewCell
        
        let row = indexPath.row
        cell.transactionCompany.font =
            UIFont.preferredFont(forTextStyle: UIFontTextStyle.headline)
        cell.transactionCompany.text = attractionNames[row]
               return cell
    }
}
