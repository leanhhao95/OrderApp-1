//
//  HistoryTVC.swift
//  OrderApp
//
//  Created by HoangLuyen on 11/17/17.
//  Copyright © 2017 Luyen. All rights reserved.
//

import UIKit
import os.log
class HistoryTVC: UITableViewController {
    let today = Date()
    let defaults = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return TransactionServices.shared.arraydate.count
    }
    
    @IBAction func createNewTransaction(_ sender: Any) {
        TransactionServices.shared.foodChosen.removeAll()
        TransactionServices.shared.qty.removeAll()
        TransactionServices.shared.totalAllFoodChosen = 0
        navigationController?.popToRootViewController(animated: true)
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! HistoryCell
            cell.dateLabel.text = TransactionServices.shared.arraydate[indexPath.row]
            cell.totalLabel.text = "\(TransactionServices.shared.arrayPrice[indexPath.row])"
        return cell
    }
}
extension Date
{
    func toString( dateFormat format  : String ) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
    
}
