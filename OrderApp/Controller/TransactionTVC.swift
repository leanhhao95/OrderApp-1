//
//  TransactionTVC.swift
//  OrderApp
//
//  Created by HoangLuyen on 11/17/17.
//  Copyright © 2017 Luyen. All rights reserved.
//

import UIKit

class TransactionTVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        TransactionServices.shared.foodChosen.removeAll()
        tableView.reloadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return TransactionServices.shared.foodChosen.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "transactionCell", for: indexPath)
        print(TransactionServices.shared.foodChosen[indexPath.row].name)
        cell.textLabel?.text = TransactionServices.shared.foodChosen[indexPath.row].name
        return cell
    }
   

    

}
