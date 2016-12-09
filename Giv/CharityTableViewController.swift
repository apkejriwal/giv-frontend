//
//  CharityTableViewController.swift
//
//
//  Created by Akash Kejriwal on 12/9/16.
//
//
import UIKit
class CharityTableViewController: UITableViewController {
    
    let auth = Auth()
    var charityNames = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.auth.getCharities(completion: self.setCharity)
        print(self.charityNames)
        print("charityNames in vdl above")
        tableView.backgroundView = UIImageView(image: UIImage(named: "blue_wallpaper-1"))
    }
    
    func setCharity(_ charities: [String]) {
        let finalCharity = charities
        self.charityNames = finalCharity
        print(self.charityNames)
        do_table_refresh()
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
        // #warning Incomplete implementation, return the number of rows
        return charityNames.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier:"CharityViewCell", for: indexPath) as! CharityViewCell
        
        let row = indexPath.row
        
        cell.layer.borderWidth = 1.5
        cell.layer.borderColor = UIColor.white.cgColor
        
        cell.charityName.text = charityNames[row]
        return cell
    }
    
    func do_table_refresh() {
        self.tableView.reloadData()
    }
    
}
