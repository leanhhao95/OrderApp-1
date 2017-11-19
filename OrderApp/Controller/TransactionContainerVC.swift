//
//  TransactionContainerVC.swift
//  OrderApp
//
//  Created by AnhHao on 11/19/17.
//  Copyright © 2017 Luyen. All rights reserved.
//

import UIKit
import os.log
class TransactionContainerVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var total:Int = 0
   let today = Date()
    @IBOutlet weak var canculateTotalLabel: Label!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return TransactionServices.shared.foodChosen.count
    }
    // tinh toan du lieu truoc
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "transactionCell", for: indexPath) as! TransactionTableViewCell
        cell.nameFoodChosenLabel.text  = TransactionServices.shared.foodChosen[indexPath.row].name
        cell.priceFoodChosenLabel.text = "\(TransactionServices.shared.foodChosen[indexPath.row].price) VNĐ"
        total = TransactionServices.shared.qty[indexPath.row] *  TransactionServices.shared.foodChosen[indexPath.row].price
        cell.totalLabel.text = "\(total) VNĐ"
        TransactionServices.shared.arrayPriceIsChosen.append(total)
        return cell
    }
    // sau khi tinh toan du lieu mo hien ra tong
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        canculateTotalLabel.text = "\(TransactionServices.shared.totalAllFoodChosen) VNĐ"
    }
    // transaction button
    @IBAction func saveContextToMeal(_ sender: Any) {
        TransactionServices.shared.arraydate.append(today.toString(dateFormat: "yyyy-MM-dd HH:mm:ss"))
        TransactionServices.shared.arrayPriceToTal.append(TransactionServices.shared.totalAllFoodChosen)
    }
    @IBAction func backBarButton(_ sender: Any) {
        TransactionServices.shared.totalAllFoodChosen = 0
        TransactionServices.shared.arrayPriceIsChosen.removeAll()
        navigationController?.popViewController(animated: true)
    }
    
}

