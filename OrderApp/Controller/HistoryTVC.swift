//
//  HistoryTVC.swift
//  OrderApp
//
//  Created by HoangLuyen on 11/17/17.
//  Copyright © 2017 Luyen. All rights reserved.
//

import UIKit
import os.log
var mainVC :RestaurantTVC? = RestaurantTVC()
class HistoryTVC: UITableViewController {
    let today = Date()
    let defaults = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = false
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
    // new barbutton
   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! HistoryCell
            cell.dateLabel.text = TransactionServices.shared.arraydate[indexPath.row]
            cell.totalLabel.text = "\(TransactionServices.shared.arrayPriceToTal[indexPath.row]) VNĐ"
            saveData()
        return cell
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            TransactionServices.shared.arraydate.remove(at: indexPath.row)
            TransactionServices.shared.arrayPriceToTal.remove(at: indexPath.row)
            saveData()
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    // luu du lieu
    func saveData() {
        defaults.set(TransactionServices.shared.arraydate, forKey: defaultKeys.dateKey)
        defaults.set(TransactionServices.shared.arrayPriceToTal, forKey: defaultKeys.priceKey)
    }
    // Mark : Action
    @IBAction func createNewTransaction(_ sender: Any) {
        TransactionServices.shared.foodChosen.removeAll()
        TransactionServices.shared.qty.removeAll()
        TransactionServices.shared.totalAllFoodChosen = 0
        navigationController?.popToRootViewController(animated: true)
    }
    
    
}
// chuyen tu time interval sang string
extension Date
{
    func toString( dateFormat format  : String ) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
    
}
